# Install lessc
#
# sudo apt-get install node node-less
# sudo make install
LESSC = lessc
RM = rm -f
LESSFILE := $(wildcard *.less)
TARGET := $(basename $(LESSFILE))

.PHONY: all target clean

target:		$(TARGET)

%:	%.less
	$(LESSC) $< -o $@.css
all:	target

clean:
	$(RM) $(TARGET).css
