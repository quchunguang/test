# Makefile

programs=nl testlex
all: 		$(programs)
	cd acalc && $(MAKE)
	cd ccalc && $(MAKE)
	cd rpncalc && $(MAKE)
	cd testflex && $(MAKE)
clean:
	rm -f $(programs) *.c *~
	cd acalc && $(MAKE) clean
	cd ccalc && $(MAKE) clean
	cd rpncalc && $(MAKE) clean
	cd testflex && $(MAKE) clean

testlex: 	testfle.l
	flex -o testlex.c testlex.l
	gcc -Wall -ansi -o testlex testlex.c
nl: 		nl.l
	flex -o nl.c nl.l
	gcc -o nl nl.c

