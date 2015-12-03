#!/bin/sh

input=`cat input`

len=`wc -c <<< $input | cat`
len=`expr $len + 0`

instr=0
floor=0
for (( i = 0; i < $len; i++ )); do
    prev=`expr $instr - 1`
    c="${input:$instr:1}"
    oldfloor=$floor
    #echo $c
    if [ "$c" = '(' ]; then
        floor=`expr $floor + 1`
    elif [ "$c" = ')' ]; then
        floor=`expr $floor - 1`
    fi
    instr=`expr $instr + 1`
    #echo "$instr : $oldfloor => $floor"
    if [ $floor -lt 0 ]; then
        echo "Santa crossed into the basement at instruction $instr"
        exit
    fi
done