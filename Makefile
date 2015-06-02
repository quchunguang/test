all:
	cd test51 && $(MAKE)
	cd testarduino && $(MAKE)
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
	cd testgo && $(MAKE)
	cd testr && $(MAKE)
	cd testc && $(MAKE)
clean:
	cd test51 && $(MAKE) clean
	cd testarduino && $(MAKE) clean
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
	cd testgo && $(MAKE) clean
	cd testr && $(MAKE) clean
	cd testc && $(MAKE) clean
