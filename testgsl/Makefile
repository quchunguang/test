# Install gsl library
#
# mkdir -p ~/share/gsl
# cd ~/share/gsl
# wget http://www.gnu.org/software/gsl/key/gsl_key.txt
# gpg --import gsl_key.txt
# wget http://mirror.hust.edu.cn/gnu/gsl/gsl-2.1.tar.gz
# wget http://mirror.hust.edu.cn/gnu/gsl/gsl-2.1.tar.gz.sig
# tar zxf gsl-2.1.tar.gz
# cd gsl-2.1
# ./configure
# make
# sudo make install
CC = gcc
RM = rm -f
CFLAGS = -g -Wall -std=c99 -DHAVE_INLINE
LDFLAGS = -lgsl -lgslcblas -lm -static
CFILE := $(wildcard *.c)
TARGET := $(basename $(CFILE))

.PHONY: all target clean

target:		$(TARGET)

%:	%.c
	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
all:	target

clean:
	$(RM) $(TARGET)
