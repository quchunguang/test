# Makefile

programs=nl testflex
all: 		$(programs)
	cd acalc && $(MAKE)
clean:
	rm $(programs) *.c *~
	cd acalc && $(MAKE) clean

testflex: 	testflex.l
	flex -o testflex.c testflex.l
	gcc -Wall -ansi -o testflex testflex.c
nl: 		nl.l
	flex -o nl.c nl.l
	gcc -o nl nl.c

