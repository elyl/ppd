#!/bin/bash

machines=`cat $OAR_FILE_NODES | uniq`
nb_machines=`cat $OAR_FILE_NODES | uniq |wc -l`

STEP=$((1000 / $nb_machines))
i=1

for m in $machines; do
    START=$((STEP * ( $i - 1 )))
    END=$((STEP * $i ))
    oarsh $m python pi_par.py $START $END > pi.part$i&
    i=$((i +1))
done
sleep 2

FILES=`cat pi.part*`
result=0

for f in $FILES
do
    result=$(echo "scale=10;$result+$f" | bc)
    `rm $f`
done

`echo $result > pi`
