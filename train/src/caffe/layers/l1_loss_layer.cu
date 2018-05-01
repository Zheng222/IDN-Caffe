#include <vector>

#include "caffe/layers/l1_loss_layer.hpp"
#include "caffe/util/math_functions.hpp"

namespace caffe {

template <typename Dtype>
void L1LossLayer<Dtype>::Forward_gpu(const vector<Blob<Dtype>*>& bottom,
    const vector<Blob<Dtype>*>& top) {
    const int count = bottom[0]->count();
    caffe_gpu_sub(
        count,
	bottom[0]->gpu_data(),
	bottom[1]->gpu_data(),
	diff_.mutable_gpu_data());

    caffe_gpu_abs(count, diff_.gpu_data(), errors_.mutable_gpu_data());
    Dtype loss;
    caffe_gpu_asum(count, errors_.gpu_data(), &loss);
    top[0]->mutable_cpu_data()[0] = loss / bottom[0]->num();
}

template <typename Dtype>
void L1LossLayer<Dtype>::Backward_gpu(const vector<Blob<Dtype>*>& top,
    const vector<bool>& propagate_down, const vector<Blob<Dtype>*>& bottom) {
    const int count = bottom[0]->count();
    for (int i = 0; i < 2; ++i) {
      if (propagate_down[i]) {
        const Dtype sign = (i == 0) ? 1 : -1;
        caffe_gpu_sign(count, diff_.gpu_data(), diff_.mutable_gpu_data());
        const Dtype alpha = sign * top[0]->cpu_diff()[0] / bottom[i]->num();
        caffe_gpu_axpby(
            count,               // count
	    alpha,               // alpha
            diff_.gpu_data(),    // a
	    Dtype(0),            // beta
	    bottom[i]->mutable_gpu_diff());   // b
      }
   } 
}

INSTANTIATE_LAYER_GPU_FUNCS(L1LossLayer);

}  // namespace caffe
