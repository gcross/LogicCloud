#!/bin/sh

HOST=`cat host`
PORT=`cat port`

cd $HOME/LogicCloud

(./count-all-nqueens-solutions worker $HOST $PORT >> worker_1.log 2>&1; /sbin/shutdown +10) &
./count-all-nqueens-solutions worker $HOST $PORT >> worker_2.log 2>&1 &
./count-all-nqueens-solutions worker $HOST $PORT >> worker_3.log 2>&1 &
./count-all-nqueens-solutions worker $HOST $PORT >> worker_4.log 2>&1 &
./count-all-nqueens-solutions worker $HOST $PORT >> worker_5.log 2>&1 &
./count-all-nqueens-solutions worker $HOST $PORT >> worker_6.log 2>&1 &
./count-all-nqueens-solutions worker $HOST $PORT >> worker_7.log 2>&1 &
./count-all-nqueens-solutions worker $HOST $PORT >> worker_8.log 2>&1 &
