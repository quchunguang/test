# http://micro.ustc.edu.cn/Fortran/ZJDing/
FOR = gfortran
FORFLAGS =
FORFILE := $(wildcard *.f90)
TARGET := $(basename $(FORFILE))

.PHONY: all target clean

target:		$(TARGET)

%:	%.f90
	$(FOR) $(FORFLAGS) $< -o $@
all:	target

clean:
	$(RM) $(TARGET)
	$(RM) multimal.mod
