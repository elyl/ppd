#!/bin/bash

#machines=`cat $OAR_FILE_NODES | uniq`
#nb_machines=`cat $OAR_FILE_NODES | uniq |wc -l`

#STEP=$((1000 / $nb_machines))
STEP=100
i=1

#for m in $machines; do
for i in `seq 1 100`
do
    START=$(echo "$STEP*($i-1)" | bc)
    END=$((STEP * $i ))
    #oarsh $m pi.sh $START $END > pi.part$i&
    echo "launching on $i"
    ./pi.sh $START $END > pi.part$i&
#    i=$((i +1))
done
sleep 2

FILES=`ls pi.part*`
result=0

for f in $FILES
do
    n=$(cat $f)
    echo $n
    echo $result
    result=$(echo "scale=10;$result+$n" | bc)
#    rm $f
done

echo $result > pi
