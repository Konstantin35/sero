#!/bin/bash

export LD_LIBRARY_PATH=lib
nohup  bin/gero --cache 4096 --trie-cache-gens 1200 --maxpeers 128 --config geroConfig.toml --datadir chaindata --mineMode --rpc --rpcaddr '127.0.0.1' --rpccorsdomain '*' > log/gero.log 2>&1 &
