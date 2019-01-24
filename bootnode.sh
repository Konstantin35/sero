#!/bin/bash
export LD_LIBRARY_PATH=lib
nohup bin/bootnode -nodekey=bootnode.key -verbosity=9 -nat=any > bootnode.log &
