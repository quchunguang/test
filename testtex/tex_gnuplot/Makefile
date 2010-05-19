all: 		input.pdf

clean:
	rm -f *.dvi *.ps *.pdf *.log *.aux gplt.tex gplt.eps

input.pdf: 	input.tex gplt.tex gplt.eps
	latex input.tex
	dvips input.dvi
	ps2pdf input.ps

gplt.tex: 	gplt2tex.dem
	gnuplot gplt2tex.dem

gplt.eps: 	gplt2eps.dem
	gnuplot gplt2eps.dem

test: 		input.pdf
	evince input.pdf
