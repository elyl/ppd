#!/bin/bash

STEP=100
i=1

for i in `seq 1 100`
do
    START=$(echo "$STEP*($i-1)" | bc)
    END=$((STEP * $i ))
    echo "launching on $i with $START and $END"
    ./pi.sh $START $END >> pi.part&
done
sleep 5

values=`cat pi.part`
result=0

for n in $values
do
    result=$(echo "scale=10;$result+$n" | bc)
done

rm pi.part
echo $result > pi
echo "Calculated value : $result"
