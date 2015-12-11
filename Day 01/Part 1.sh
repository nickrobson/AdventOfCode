#!/bin/sh

input=`cat input`

opens=`sed s/\)//g <<< $input`
closes=`sed s/\(//g <<< $input`

olen=`wc -c <<< $opens | cat`
clen=`wc -c <<< $closes | cat`

floor=`expr $olen - $clen`
echo "Santa ended up on floor $floor" 