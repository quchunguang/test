CC = gcc
RM = rm -f
CFLAGS = -g -Wall -std=c99
LDFLAGS = -lm
CFILE := $(wildcard *.c)
TARGET := $(basename $(CFILE))

.PHONY: all target clean

target:		$(TARGET)

%:	%.c
	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
all:	target

clean:
	$(RM) $(TARGET)
