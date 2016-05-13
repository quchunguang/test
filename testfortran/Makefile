FOR = gfortran
FORFLAGS =
FORFILE := $(wildcard *.f)
TARGET := $(basename $(FORFILE))

.PHONY: all target clean

target:		$(TARGET)

%:	%.f
	$(FOR) $(FORFLAGS) $< -o $@
all:	target

clean:
	$(RM) $(TARGET)
