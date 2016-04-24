#!/bin/bash

for m in `seq 100 100 10000`
do
    echo $m
    /usr/bin/time -f $m' %E' -a -o times /home/alheureux/ppd/pi_launcher_g5k.sh $m > /dev/null
done
