all:
	cd testbison && $(MAKE) 
	cd testcore && $(MAKE)
	cd testdb && $(MAKE)
	cd testother && $(MAKE)
	cd bookalp && $(MAKE)
	cd testgettext && $(MAKE)
	cd testkernel && $(MAKE)
	cd testcore && $(MAKE)
	cd bookdbg && $(MAKE)
	cd testtex && $(MAKE)
	cd testpy && $(MAKE)
	cd testasm && $(MAKE)
	cd testopencv && $(MAKE)
	cd testpostgresql && $(MAKE)
clean:
	cd testbison && $(MAKE) clean
	cd testcore && $(MAKE) clean
	cd testdb && $(MAKE) clean
	cd testother && $(MAKE) clean
	cd bookalp && $(MAKE) clean
	cd testgettext && $(MAKE) clean
	cd testkernel && $(MAKE) clean
	cd testcore && $(MAKE) clean
	cd bookdbg && $(MAKE) clean
	cd testtex && $(MAKE) clean
	cd testpy && $(MAKE) clean
	cd testasm && $(MAKE) clean
	cd testopencv && $(MAKE) clean
	cd testpostgresql && $(MAKE) clean
