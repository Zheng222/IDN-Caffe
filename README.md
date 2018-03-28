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

The results are stored in "results" folder, with both reconstructed images and PSNR/SSIM/IFCs.
## Citation

If you find IDN useful in your research, please consider citing:
```
@article{Hui-IDN-2018,
  title={Fast and Accurate Single Image Super-Resolution via Information Distillation Network},
  author={Hui, Zheng and Wang, Xiumei and Gao, Xinbo},
  journal={arXiv preprint arXiv:1803.09454},
  year={2018}
}
```
