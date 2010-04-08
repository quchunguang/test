#!/bin/sh
cat >new18.asm <<_END
global _start

_start:
ud0
ud1
ud2
_END
nasm -f elf new18.asm
ld new18.o
objcopy -S -R .comment -R .bss a.out
./a.out
objdump -d a.out
readelf -a a.out
hexdump -C a.out
