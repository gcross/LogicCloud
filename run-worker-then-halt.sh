#!/bin/sh

cd $HOME/Projects/LogicCloud

(./count-all-nqueens-solutions worker $1 $2 >> worker_1.log 2>&1; /sbin/halt +1) &
./count-all-nqueens-solutions worker $1 $2 >> worker_2.log 2>&1 &
./count-all-nqueens-solutions worker $1 $2 >> worker_3.log 2>&1 &
./count-all-nqueens-solutions worker $1 $2 >> worker_4.log 2>&1 &
./count-all-nqueens-solutions worker $1 $2 >> worker_5.log 2>&1 &
./count-all-nqueens-solutions worker $1 $2 >> worker_6.log 2>&1 &
./count-all-nqueens-solutions worker $1 $2 >> worker_7.log 2>&1 &
./count-all-nqueens-solutions worker $1 $2 >> worker_8.log 2>&1 &
