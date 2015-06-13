AS = as
LD = ld
RM = rm -f

ASMFILE := $(wildcard *.s)
TARGET := $(basename $(ASMFILE))

.PHONY: all target clean

target:		$(TARGET)

%:	%.s
	$(AS) $< -o $@.o
	$(LD) $@.o -o $@

all:	target

clean:
	$(RM) $(TARGET) *.o
