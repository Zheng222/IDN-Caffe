#!/usr/bin/env bash
# train from scratch
~/local/caffe/build/tools/caffe train -solver IDN_solver.prototxt -gpu 0 2>&1 | tee -a IDN_x2.log

# train from pretrained model
#~/local/caffe/build/tools/caffe train -solver IDN_solver.prototxt -weights ../test/caffemodel/IDN_x2.caffemodel -gpu 0 2>&1 | tee -a IDN_x2.log