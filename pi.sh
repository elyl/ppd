#!/bin/bash

START=$(echo "$1*100" | bc)
END=$(echo "$START+100" | bc)
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
