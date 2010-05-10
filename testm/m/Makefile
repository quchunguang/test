# Makefile - for a basic kernel module
obj-m += hello.o
obj-m += modhello.o
obj-m += hello-2.o
obj-m += hello-3.o
obj-m += hello-4.o
obj-m += hello-5.o
obj-m += startstop.o
startstop-objs := start.o stop.o
obj-m += chardev.o
obj-m += chardev-2.o
obj-m += procfs.o
# usage: insmod irq=14 interface=testqrq
# irq from cat /proc/interrupts|grep eth
obj-m += testirq.o
obj-m += testtasklet.o
obj-m += testworkqueue.o
# usage: see testmm.c
# obj-m += testmm.o
obj-m += testsem.o
obj-m += testcompletion.o
obj-m += testproducer.o

clean:
	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c .tmp_versions
all:
	make -C /usr/src/linux SUBDIRS=`pwd` modules

