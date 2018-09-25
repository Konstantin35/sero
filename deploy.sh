#!/bin/bash

sh update.sh
sh stop.sh
sh clean.sh


local_ip=`ip a | grep inet | grep -v inet6 | grep -v 127|awk '{print $2}'|cut -d '/' -f1`
echo $local_ip
cd ~/sero
nohup  ./gero --datadir chain --port 30314  --rpc --rpcport 8545 --rpcaddr "$local_ip" --rpccorsdomain "*" --nodiscover --dev --devpassword 123456 --gcmode archive &
