#!/bin/bash
nohup bin/bootnode -nodekey=bootnode.key -verbosity=9 -addr :60609 -nat=any > bootnode.log 2>1&
