root_path="$PWD"
mkdir -p "src/github.com/sero-cash"

git_path="$root_path/src/github.com/sero-cash"
cd "$git_path"
if [ ! -d "go-czero-import" ];then
        git clone https://gitee.com/sero-cash/go-czero-import.git
else
        cd "go-czero-import"
        git fetch&&git rebase
fi

cd "$git_path"
if [ ! -d "go-sero" ];then
        git clone https://gitee.com/sero-cash/go-sero.git
else
        cd "go-sero"
        git fetch&&git rebase
fi


cd "$git_path/go-sero"
export LD_LIBRARY_PATH=$root_path/lib
make all
