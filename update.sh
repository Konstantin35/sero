root_path="$PWD"
mkdir -p "src/github.com/sero-cash"

git_path="$root_path/src/github.com/sero-cash"
cd "$git_path"
if [ ! -d "go-czero-import" ];then
        git clone https://github.com/sero-cash/go-czero-import.git
else
        cd "go-czero-import"
        git fetch&&git rebase
fi

cd "$git_path"
if [ ! -d "go-sero" ];then
        git clone https://github.com/sero-cash/go-sero.git
else
        cd "go-sero"
        git fetch&&git rebase
fi

cd "$git_path"
if [ ! -d "mine-pool" ];then
        git clone https://github.com/sero-cash/mine-pool.git
else
        cd "mine-pool"
        git fetch&&git rebase
fi


cd "$git_path/go-sero"
export LD_LIBRARY_PATH=$root_path/lib
make all

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
cd "$git_path/mine-pool"
if [ "Darwin" == "$SNAME" ]
then
     make "darwin"
elif [ "Linux-V3" == "$SNAME" ]
then
     make "linux-v3"
elif [ "Linux-V4" == "$SNAME" ]
then
     make "linux-v4"
elif [ "$SNAME" == "Linux-*" ]
then
     echo "only support linux kernal v3 or v4"
     exit
else
   echo "only support Mingw"
   exit
fi
