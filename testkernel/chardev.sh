#!/bin/sh

if [ "$1" = "-i" ]; then
	sudo insmod m/chardev.ko
	sudo mknod /dev/hello c 251 0
	echo "/dev/hello created ..."
elif [ "$1" = "-u" ]; then
	sudo rm /dev/hello
	sudo rmmod chardev
	echo "/dev/hello removed ..."
else
	echo "Usage: ./chardev.sh [-i|-u]"
fi
