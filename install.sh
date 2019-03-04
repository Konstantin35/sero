#!/bin/bash

root_path="$PWD"

sh update.sh
git_path="$root_path/src/github.com/sero-cash"
function sysname() {
    SYSTEM=`uname -s |cut -f1 -d_`
    if [ "Darwin" == "$SYSTEM" ];then
        echo "Darwin"
    elif [ "Linux" == "$SYSTEM" ];then
        name=`uname  -r |cut -f1 -d.`
        echo Linux-V"$name"
    else
        echo "$SYSTEM"
    fi
}

SNAME=`sysname`
cd $root_path
if [ ! -L "data" ];then
        ln -s "$git_path/go-czero-import/czero/data" data
fi
if [ ! -d "bin" ];then
	mkdir "bin"
        ln -s "$git_path/go-sero/build/bin/gero" "bin/"
	ln -s "$git_path/mine-pool/build/bin/mine-pool" "bin/"
fi
if [ ! -L "lib" ];then
     	if [ "Darwin" == "$SNAME" ];then
     		ln -s "$git_path/go-czero-import/czero/lib_DARWIN_AMD64" lib
	elif [ "Linux-V3" == "$SNAME" ];then
     		ln -s "$git_path/go-czero-import/czero/lib_LINUX_AMD64_V3" lib
	elif [ "Linux-V4" == "$SNAME" ];then
     		ln -s "$git_path/go-czero-import/czero/lib_LINUX_AMD64_V4" lib
	elif [ "$SNAME" == "Linux-*" ];then
     		echo "only support linux kernal v3 or v4"
     		exit
	else
   		echo "only support Mingw"
	fi
fi
