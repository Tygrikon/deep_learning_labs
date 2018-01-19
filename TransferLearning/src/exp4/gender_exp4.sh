#!/bin/bash

set -e

WORK_DIR=/home/glebg/dev/deep-learning
CAFFE_ROOT=$WORK_DIR/caffe
CAFFE_BUILD=$CAFFE_ROOT/build
EXP_DIR=exp4
MODELS_DIR=$WORK_DIR/lab4/$EXP_DIR

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CAFFE_BUILD/lib

# Train
echo "Train"
$CAFFE_BUILD/tools/caffe train -gpu=0 -solver=$MODELS_DIR/gender_${EXP_DIR}_solver.prototxt $@

# Test
echo "Test"
$CAFFE_BUILD/tools/caffe test -gpu=0 -model=$MODELS_DIR/gender_${EXP_DIR}_train.prototxt -weights=$MODELS_DIR/snapshots/gender_${EXP_DIR}_iter_15000.caffemodel $@
