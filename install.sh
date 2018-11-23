#!/bin/bash

root_path="$PWD"

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:root_path/lib

mkdir -p "src/github.com/sero-cash"
git_path="$root_path/src/github.com/sero-cash"
cd "$git_path"
if [ ! -d "go-czero-import" ];then
	git clone git@github.com:sero-cash/go-czero-import.git
else
	cd "go-czero-import"
	git fetch&&git rebase
fi

cd "$git_path"
if [ ! -d "go-sero" ];then
	git clone git@github.com:sero-cash/go-sero.git
else
	cd "go-sero"
	git fetch&&git rebase
fi

cd $root_path
if [ ! -L "data" ];then
	ln -s "src/github.com/sero-cash/go-czero-import/czero/data" data
fi

if [ ! -L "bin" ];then
	ln -s "src/github.com/sero-cash/go-sero/build/bin" bin
fi

cd "$git_path/go-sero"
make all


