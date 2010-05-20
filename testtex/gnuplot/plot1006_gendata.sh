#!/bin/bash

for i in `seq 10`
#while true
do 
	echo "`date +%H:%M:%S` `echo "scale=3;1/${i}" | bc`"
	#echo "`date +%H:%M:%S` `ps -ef | grep 1006 | wc -l`"
	sleep 1
done > plot1006.dat
