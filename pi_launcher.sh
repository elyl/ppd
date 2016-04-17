#!/bin/bash

NB_PROC=100

for i in `seq 0 $NB_PROC`
do
    `/home/m1/lheureux/ppd/tp2/pi.sh $i > pi_$i&`
done
