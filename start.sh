#!/bin/bash

cmd="bin/gero --datadir chain --port 30314  --rpc --rpcport 8545 --rpcaddr '0.0.0.0' --rpccorsdomain '*' --rpcapi 'personal,db,sero,net,web3,txpool,miner'"
while [ "$#" -ge "1" ];do
    case $1 in
       --dev)
         cmd="$cmd --dev"
         ;;
       --devpassword)
         cmd="$cmd --devpassword $2"
	 ;;
       --alpha)
  	 cmd="$cmd --alpha"
	 ;;
    esac
    shift
done
echo $cmd
nohup $cmd &
