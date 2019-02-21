#!/bin/bash

export LD_LIBRARY_PATH=lib
nohup  bin/gero --cache 4096 --trie-cache-gens 1200 --maxpeers 256 --config geroConfig.toml --datadir chaindata > log/gero.log 2>&1 &
