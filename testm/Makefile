obj-m += m/

all:
	#make -C /usr/src/linux SUBDIRS=`pwd` modules
	make -C /lib/modules/`uname -r`/build SUBDIRS=`pwd` modules
	#make -C /lib/modules/2.6.31-14-generic/build SUBDIRS=`pwd` modules
clean:
	rm -rf *.o .*.o.d *~ core .depend .*.cmd *.ko *.mod.c modules.order .tmp_versions
	cd m && $(MAKE) clean
