#!/bin/sh
make clean
make CFLAGS="-ggdb -Wall -ansi"
./myprog
gdb ./myprog ./core
