export LD_LIBRARY_PATH=lib
kill -9 `cat pid`
nohup bin/mine-pool config.json >> log/pool.log 2>&1 & echo $! > pid
