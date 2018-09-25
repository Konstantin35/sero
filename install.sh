#!/bin/bash

root_path="$PWD"
mkdir -p "src/github.com/sero-cash"
git_path="$root_path/src/github.com/sero-cash"
cd "$git_path"
git clone git@github.com:sero-cash/go-czero-import.git
git clone git@github.com:sero-cash/go-sero.git
cd "$git_path/go-czero-import/czero/lib"
ln -s "$root_path/lib/libczero.so" libczero.so
cd $root_path
ln -s "src/github.com/sero-cash/go-czero-import/czero/data" data
ln -s "src/github.com/sero-cash/go-sero/build/bin/gero" gero
cd "$git_path/go-sero"
make all
