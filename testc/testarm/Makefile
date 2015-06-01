# Cross compile from ubuntu 15.04 x64
# sudo apt-get install build-essential git
# mkdir -p ~/share/raspberry && cd ~/share/raspberry
# git clone git://github.com/raspberrypi/tools.git
# vim ~/.bashrc
# export PATH=$HOME/share/raspberry/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin:$PATH
# source ~/.bashrc
# arm-linux-gnueabihf-gcc -v
CC = arm-linux-gnueabihf-gcc

# Compile on raspberry pi 2 directly
# CC = gcc

RM = rm -f
CFLAGS = -g -Wall -std=c99
LDFLAGS = -lm
CFILE := $(wildcard *.c)
TARGET := $(basename $(CFILE))

.PHONY: all target clean

target:		$(TARGET)

%:	%.c
	$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
all:	target

clean:
	$(RM) $(TARGET)
	$(RM) log.txt
