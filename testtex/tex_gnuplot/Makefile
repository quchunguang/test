all: 		input.pdf

clean:
	rm -f *.dvi *.ps *.pdf *.log *.aux gplt.tex gplt.eps

input.pdf: 	input.tex gplt.tex gplt.eps
	latex input.tex # fig lable generated
	latex input.tex
	dvips input.dvi
	ps2pdf input.ps

gplt.tex: 	gplt2tex.gnu
	gnuplot gplt2tex.gnu

gplt.eps: 	gplt2eps.gnu
	gnuplot gplt2eps.gnu

test: 		input.pdf
	evince input.pdf
