#!/bin/bash

machines=`cat $OAR_FILE_NODES | uniq`
nb_machines=`cat $OAR_FILE_NODES | uniq |wc -l`

STEP=$((1000 / $nb_machines))
i=1

for m in $machines
do
    START=$(echo "$STEP*($i-1)" | bc)
    END=$((STEP * $i ))
    echo "launching on $i with $START and $END"
    oarsh $m pi.sh $START $END >> pi.part&
    i=$((i +1))
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
