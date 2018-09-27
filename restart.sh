#!/bin/bash

sh update.sh
sh stop.sh

if [ -n "$1" ]; then
	sh start.sh $1
else
	sh start.sh
fi
