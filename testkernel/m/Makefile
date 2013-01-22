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
#obj-m += testsem.o
obj-m += testcompletion.o
#obj-m += testproducer.o
obj-m += hackthis.o

KDIR = /lib/modules/`uname -r`/build
all:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
clean:
	rm -rf *.o .*.o.d *~ core .depend .*.cmd *.ko *.mod.c modules.order .tmp_versions Module.symvers
