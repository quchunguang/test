# Makefile

programs=nl testflex
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

testflex: 	testflex.l
	flex -o testflex.c testflex.l
	gcc -Wall -ansi -o testflex testflex.c
nl: 		nl.l
	flex -o nl.c nl.l
	gcc -o nl nl.c

