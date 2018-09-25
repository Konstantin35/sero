#!/bin/bash
nohup ./bootnode -nodekey=bootnode.key -verbosity=9 -addr :60609 -nat=any > bootnode.log 2>1&
