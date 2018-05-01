#!/usr/bin/env bash

~/local/caffe/build/tools/caffe train -solver IDN_solver.prototxt -gpu 0 2>&1 | tee -a IDN_x2.log