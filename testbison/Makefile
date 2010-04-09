# Makefile

programs=nl testflex
all: 		$(programs)
clean:
	rm $(programs) *.c *~

testflex: 	testflex.l
	flex -o testflex.c testflex.l
	gcc -Wall -ansi -o testflex testflex.c
nl: 		nl.l
	flex -o nl.c nl.l
	gcc -Wall -ansi -o nl nl.c

