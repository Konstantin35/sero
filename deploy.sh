#!/bin/bash

branch=master
if [ -n "$1" ]; then
    branch=$1
fi

flag=false
root_path="$PWD"
git_path="$root_path/src/github.com/sero-cash/go-sero"

cd "$git_path"
git checkout -t "origin/$branch"
git checkout $branch

cd $root_path
sh update.sh
sh clean.sh
sh restart.sh
