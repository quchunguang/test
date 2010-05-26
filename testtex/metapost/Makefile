all: 			testmpost
clean:
	rm -f *.log *.dvi *.ps *.pdf *.aux testmpost.1 testmpost.2
testmpost: 		testmpost.eps testmpost.tex
	latex testmpost.tex
	dvips testmpost.dvi
	ps2pdf testmpost.ps

testmpost.eps: 		testmpost.mp
	mpost $<

test: 			testmpost
	evince testmpost.pdf &
