#!/bin/sh

HOST=`cat host`
PORT=`cat port`

cd $HOME/LogicCloud

./count-all-nqueens-solutions worker $HOST --port=$PORT \
        --end-stats=all --log-end-stats --log-stats-all \
        --log-format='$time:$prio:$message' \
        &>> worker_1.log &
./count-all-nqueens-solutions worker $HOST --port=$PORT \
        --end-stats=all --log-end-stats --log-stats-all \
        --log-format='$time:$prio:$message' \
        &>> worker_2.log &
./count-all-nqueens-solutions worker $HOST --port=$PORT \
        --end-stats=all --log-end-stats --log-stats-all \
        --log-format='$time:$prio:$message' \
        &>> worker_3.log &
./count-all-nqueens-solutions worker $HOST --port=$PORT \
        --end-stats=all --log-end-stats --log-stats-all \
        --log-format='$time:$prio:$message' \
        &>> worker_4.log &
./count-all-nqueens-solutions worker $HOST --port=$PORT \
        --end-stats=all --log-end-stats --log-stats-all \
        --log-format='$time:$prio:$message' \
        &>> worker_5.log &
./count-all-nqueens-solutions worker $HOST --port=$PORT \
        --end-stats=all --log-end-stats --log-stats-all \
        --log-format='$time:$prio:$message' \
        &>> worker_6.log &
./count-all-nqueens-solutions worker $HOST --port=$PORT \
        --end-stats=all --log-end-stats --log-stats-all \
        --log-format='$time:$prio:$message' \
        &>> worker_7.log &
./count-all-nqueens-solutions worker $HOST --port=$PORT \
        --end-stats=all --log-end-stats --log-stats-all \
        --log-format='$time:$prio:$message' \
        &>> worker_8.log &
