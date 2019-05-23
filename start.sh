#!/bin/bash

export LD_LIBRARY_PATH=lib
bin/gero --config geroConfig.toml --port 53718 --maxpeers 256 --vthreads 4 --datadir chaindata --mineMode > log/gero.log 2>&1 &
