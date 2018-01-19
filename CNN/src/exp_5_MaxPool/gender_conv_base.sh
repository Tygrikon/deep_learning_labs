#!/bin/bash

set -e

WORK_DIR=/home/glebg/dev/deep-learning
CAFFE_ROOT=$WORK_DIR/caffe
CAFFE_BUILD=$CAFFE_ROOT/build
EXP_DIR=exp1_conv
MODELS_DIR=$WORK_DIR/lab2/$EXP_DIR/gender_conv


export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CAFFE_BUILD/lib

if [ ! -d "$MODELS_DIR" ]; then
    mkdir -p $MODELS_DIR
fi

# Train FCN
echo "Train FCN"
$CAFFE_BUILD/tools/caffe train -gpu=0 -solver=$WORK_DIR/lab2/$EXP_DIR/gender_conv_solver_base.prototxt $@

# Test FCN regression
# echo "Test FCN"
$CAFFE_BUILD/tools/caffe test -gpu=0 -model=$WORK_DIR/lab2/$EXP_DIR/gender_conv_base.prototxt -solver=$WORK_DIR/lab2/$EXP_DIR/gender_conv_solver_base.prototxt -weights="$MODELS_DIR/gender_conv_1.2_iter_10000.caffemodel" $@
