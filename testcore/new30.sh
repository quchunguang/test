#!/bin/sh
nasm -felf -O2 -w+orphan-labels new30.asm && gcc -nostartfiles new30.o
objcopy -S -R .comment -R .bss a.out
./a.out
objdump -d -j .text a.out

