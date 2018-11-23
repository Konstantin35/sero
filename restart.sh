#!/bin/bash

sh update.sh
sh stop.sh "gero"
sh start.sh $1
