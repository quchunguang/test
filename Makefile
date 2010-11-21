all:
	cd testbison && $(MAKE) 
	cd testcore && $(MAKE)
	cd testdb && $(MAKE)
	cd testother && $(MAKE)
	cd testassert && $(MAKE)
	cd bookalp && $(MAKE)
	cd testgettext && $(MAKE)
	cd testm && $(MAKE)
	cd testcore && $(MAKE)
	cd bookdbg && $(MAKE)
	cd testtex && $(MAKE)
	cd testpy && $(MAKE)
	cd testpostgresql && $(MAKE)
clean:
	cd testbison && $(MAKE) clean
	cd testcore && $(MAKE) clean
	cd testdb && $(MAKE) clean
	cd testother && $(MAKE) clean
	cd testassert && $(MAKE) clean
	cd bookalp && $(MAKE) clean
	cd testgettext && $(MAKE) clean
	cd testm && $(MAKE) clean
	cd testcore && $(MAKE) clean
	cd bookdbg && $(MAKE) clean
	cd testtex && $(MAKE) clean
	cd testpy && $(MAKE) clean
	cd testpostgresql && $(MAKE) clean
