#!/bin/bash

export LD_LIBRARY_PATH=lib
nohup  bin/gero --cache 4096 --trie-cache-gens 1200 --maxpeers 256 --datadir data  > log/$i.log &
