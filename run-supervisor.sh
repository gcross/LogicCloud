#!/bin/sh

SIZE=`cat size`
PORT=`cat port`

cd $HOME/LogicCloud

if [ ! -f finished-$SIZE ]
then
    ./count-all-nqueens-solutions supervisor $SIZE --port=$PORT \
            --end-stats=all --log-end-stats --log-stats-all \
            --log-format='$time:$prio:$message' \
            &>> supervisor.log &
    ./count-all-nqueens-solutions worker localhost --port=$PORT \
            --end-stats=all --log-end-stats --log-stats-all \
            --log-format='$time:$prio:$message' \
            &>> worker_1.log &
    ./count-all-nqueens-solutions worker localhost --port=$PORT \
            --end-stats=all --log-end-stats --log-stats-all \
            --log-format='$time:$prio:$message' \
            &>> worker_2.log &
    ./count-all-nqueens-solutions worker localhost --port=$PORT \
            --end-stats=all --log-end-stats --log-stats-all \
            --log-format='$time:$prio:$message' \
            &>> worker_3.log &
    ./count-all-nqueens-solutions worker localhost --port=$PORT \
            --end-stats=all --log-end-stats --log-stats-all \
            --log-format='$time:$prio:$message' \
            &>> worker_4.log &
    ./count-all-nqueens-solutions worker localhost --port=$PORT \
            --end-stats=all --log-end-stats --log-stats-all \
            --log-format='$time:$prio:$message' \
            &>> worker_5.log &
    ./count-all-nqueens-solutions worker localhost --port=$PORT \
            --end-stats=all --log-end-stats --log-stats-all \
            --log-format='$time:$prio:$message' \
            &>> worker_6.log &
    ./count-all-nqueens-solutions worker localhost --port=$PORT \
            --end-stats=all --log-end-stats --log-stats-all \
            --log-format='$time:$prio:$message' \
            &>> worker_7.log &
fi
