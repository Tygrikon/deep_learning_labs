#!/bin/bash

set -e

LD_LIBRARY_PATH=/home/novak_a/usr_lib/
export LD_LIBRARY_PATH

CAFFE_ROOT=$HOME/Documents/caffe/dependencies/caffe
CAFFE_BUILD=$CAFFE_ROOT/build
MODELS_DIR=gender_fcn_relearn

# Train FCN
echo "Train FCN on MNIST dataset"
#mkdir $MODELS_DIR
$CAFFE_ROOT/build/tools/caffe train --gpu=1 --solver=gender_fcn_solver_relearn.prototxt --weights="gender_fcn_autoencoder/gender_fcn_iter_2000.caffemodel" $@

# Test FCN regression
echo "Test FCN on MNIST dataset"
$CAFFE_ROOT/build/tools/caffe test --model=gender_fcn_relearn.prototxt --solver=gender_fcn_solver_relearn.prototxt --weights="gender_fcn_relearn/gender_fcn_iter_2000.caffemodel" $@