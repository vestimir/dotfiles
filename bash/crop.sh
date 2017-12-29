#!/bin/bash
W=$1
H=$2
INPUT=$3
dims=$W-$H
convert $INPUT -thumbnail $Wx$H^ -gravity center -extent $Wx$H $dims-$INPUT