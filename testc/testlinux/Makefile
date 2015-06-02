CC = gcc
RM = rm -f
# -std=gnu11 by default, witch is c11 standard with some gnu extensions.
CFLAGS = -g -Wall -std=gnu11
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
