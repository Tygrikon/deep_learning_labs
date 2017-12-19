#!/bin/bash

set -e

LD_LIBRARY_PATH=/home/novak_a/usr_lib/
export LD_LIBRARY_PATH

CAFFE_ROOT=$HOME/Documents/caffe/dependencies/caffe
CAFFE_BUILD=$CAFFE_ROOT/build
MODELS_DIR=gender_ccn_autoencoder

# Train cCN
echo "Train FCN on MNIST dataset"
#mkdir $MODELS_DIR
$CAFFE_ROOT/build/tools/caffe train --gpu=1 --solver=gender_ccn_solver_autoencoder.prototxt $@

# Test CCN regression
echo "Test CCN on MNIST dataset"
$CAFFE_ROOT/build/tools/caffe test --model=gender_ccn_autoencoder.prototxt --solver=gender_ccn_solver_autoencoder.prototxt --weights="gender_ccn_autoencoder/gender_ccn_iter_2000.caffemodel" $@