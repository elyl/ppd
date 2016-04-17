#!/bin/bash

START=$1
END=$2
SCALE=10

i=0
n=0

for i in `seq $START $END`
do
    result=$(echo "scale=$SCALE;(-1^$i)/((2*$i)+1)" | bc)
    n=$(echo "scale=$SCALE;$n+$result" | bc)
done

n=$(echo "scale=$SCALE;$n*4" | bc)
echo $n
