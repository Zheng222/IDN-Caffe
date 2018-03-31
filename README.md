# IDN-Caffe
Caffe implementation of "Fast and Accurate Single Image Super-Resolution via Information Distillation Network" 

[arxiv](http://arxiv.org/abs/1803.09454)

## Run test

* Install Caffe, Matlab R2013b
* Run testing:
```bash
$ cd ./test
$ matlab
>> test_IDN
```
**Note:** Please make sure the matcaffe is complied successfully.

`./test/caffemodel/IDN_x2.caffemodel`, `./test/caffemodel/IDN_x3.caffmodel` and `./test/caffemodel/IDN_x4.caffemodel` are obtained by training the model with 291 images, and `./test/caffemodel/IDN_x4_mscoco.caffemodel` is got through training the same model with mscoco dataset.

The results are stored in "results" folder, with both reconstructed images and PSNR/SSIM/IFCs.
## Citation

If you find IDN useful in your research, please consider citing:

```
@inproceedings{Hui-IDN-2018,
  title={Fast and Accurate Single Image Super-Resolution via Information Distillation Network},
  author={Hui, Zheng and Wang, Xiumei and Gao, Xinbo},
  booktitle={CVPR},
  year={2018}
}
```
