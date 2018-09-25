#!/bin/bash

sh update.sh
sh stop.sh


params=""
cat config | while read line
do
    key=`echo $line | cut -d \= -f 1`
    val=`echo $line | cut -d \= -f 2`
    echo $key $val
    case $key in
      env)
        echo "env"
        params=$params" --"$val
	echo $params
 	;;
      devpassword)
        echo "password"
        params=$params" --devpassword "$val
	echo $params
        ;;
      *)
       echo "未知参数"
       ;;
    esac
done
echo $params

sh start.sh --dev --devpassword "123456"
