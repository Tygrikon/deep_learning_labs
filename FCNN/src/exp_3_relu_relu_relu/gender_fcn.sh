#!/bin/bash

set -e

WORK_DIR=/home/glebg/dev/deep-learning
CAFFE_ROOT=$WORK_DIR/caffe
CAFFE_BUILD=$CAFFE_ROOT/build
EXP_DIR=exp_3_relu_relu_relu
MODELS_DIR=$WORK_DIR/lab1/$EXP_DIR/gender_fcn


export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CAFFE_BUILD/lib

if [ ! -d "$MODELS_DIR" ]; then
    mkdir -p $MODELS_DIR
fi

# Train FCN
echo "Train FCN"
$CAFFE_BUILD/tools/caffe train -gpu=0 -solver=$WORK_DIR/lab1/$EXP_DIR/gender_fcn_solver.prototxt $@

# Test FCN regression
echo "Test FCN"
$CAFFE_BUILD/tools/caffe test -model=$WORK_DIR/lab1/$EXP_DIR/gender_fcn.prototxt -solver=$WORK_DIR/lab1/$EXP_DIR/gender_fcn_solver.prototxt -weights="$MODELS_DIR/gender_fcn_iter_10000.caffemodel" $@
