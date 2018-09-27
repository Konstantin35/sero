#!/bin/bash

sh stop.sh
sh update.sh

if [ -n "$1" ]; then
	sh start.sh $1
else
	sh start.sh
fi
