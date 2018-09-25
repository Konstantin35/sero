
git_path="$PWD/src/github.com/sero-cash"
cd "$git_path/go-sero"
git fetch&&git rebase
make all

cd "$git_path/go-czero-import"
git fetch&&git rebase

