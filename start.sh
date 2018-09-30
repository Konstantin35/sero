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
	nohup  bin/gero --datadir "chain_$i" --port $(expr $i + 30310)  --rpc --rpcport $(expr $i + 8545) --rpcaddr "0.0.0.0" --rpccorsdomain "*" --dev --devpassword 123456 --rpcapi 'personal,db,sero,net,web3,txpool,miner' > log/$i.log &
done
