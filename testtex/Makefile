PDF_PRJS=test1 test2 test3 test4

all: 		$(PDF_PRJS)
clean:
	rm -f *.pdf *.log *.aux *.toc *.dvi

$(PDF_PRJS): \
%: 		%.tex
	xelatex $< >/dev/null

test: 		test3
	@evince test3.pdf
