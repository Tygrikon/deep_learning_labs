#!/bin/bash

set -e

LD_LIBRARY_PATH=/home/novak_a/usr_lib/
export LD_LIBRARY_PATH

CAFFE_ROOT=$HOME/Documents/caffe/dependencies/caffe
CAFFE_BUILD=$CAFFE_ROOT/build
MODELS_DIR=gender_ccn_autoencoder

# Train cCN
echo "Train CCN stack1"
#mkdir $MODELS_DIR
$CAFFE_ROOT/build/tools/caffe train --gpu=1 --solver=stack1_solver.prototxt $@

echo "Train CCN stack2"
#mkdir $MODELS_DIR
$CAFFE_ROOT/build/tools/caffe train --gpu=1 --solver=stack2_solver.prototxt --weights="stack1/gender_ccn_iter_2000.caffemodel" $@


sh gender_ccn_relearn.sh