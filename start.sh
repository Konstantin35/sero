#!/bin/bash

sh stop.sh
sleep 1
total=0
if [ -n "$1" ]; then
    total=$(expr $1 - 1)
fi

for i in $(seq 0 $total)  
do   
echo "start $i"  
	nohup  bin/gero --datadir "chain_$i" --port $(expr $i + 30310) --alpha > log/$i.log &
done
