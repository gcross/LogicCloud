#!/bin/sh

SIZE=`cat size`
PORT=`cat port`

cd $HOME/LogicCloud

if [ ! -f finished-$SIZE ]
then
    ./count-all-nqueens-solutions supervisor $SIZE --port=$PORT \
            --end-stats=all --log-end-stats --log-stats=all \
            --log-format='$time:$prio:$message' \
            >> supervisor.log 2>&1 &
    ./count-all-nqueens-solutions worker localhost $PORT >> worker_1.log 2>&1 &
    ./count-all-nqueens-solutions worker localhost $PORT >> worker_2.log 2>&1 &
    ./count-all-nqueens-solutions worker localhost $PORT >> worker_3.log 2>&1 &
    ./count-all-nqueens-solutions worker localhost $PORT >> worker_4.log 2>&1 &
    ./count-all-nqueens-solutions worker localhost $PORT >> worker_5.log 2>&1 &
    ./count-all-nqueens-solutions worker localhost $PORT >> worker_6.log 2>&1 &
    ./count-all-nqueens-solutions worker localhost $PORT >> worker_7.log 2>&1 &
fi
