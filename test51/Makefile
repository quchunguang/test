# Install:
# 	sudo apt-get install sdcc python-serial
# 	cd ~/share && git clone github.com/laborer/stcflash
# 	cd ~/test/test51
# 	ln -s ~/share/stcflash/stcflash.py
#
# Usage:
# 	make          # Compile and make .bin files
#   make upload   # Upload main.bin file to device
#
CFILE := $(wildcard *.c)
TARGET := $(basename $(CFILE))

.PHONY:	all target upload clean

target:	$(TARGET).bin

%.ihx:	%.c
	sdcc -o $@ $<
%.hex:	%.ihx
	packihx $< > $@
%.bin:	%.hex
	objcopy -I ihex -O binary $< $@

all:	target

upload: main.bin
	sudo python stcflash.py main.bin

clean:
	rm -f *.lk *.map *.rel *.sym *.asm *.ihx *.lst *.mem *.rst *.hex *.bin
