all: 		rpncalc calc itcalc mfcalc
clean: 		
	rm -f rpncalc calc itcalc mfcalc *.tab.c *~
rpncalc: 	rpncalc.y
	bison rpncalc.y
	gcc -lm -o rpncalc rpncalc.tab.c
calc: 		calc.y
	bison calc.y
	gcc -lm -o calc calc.tab.c
itcalc: 	itcalc.y
	bison itcalc.y
	gcc -lm -o itcalc itcalc.tab.c

mfcalc: 	mfcalc.y mfcalc.h 
	bison mfcalc.y
	gcc -lm -o mfcalc mfcalc.tab.c
