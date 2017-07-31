PDF_PRJS=test1 test2 test3 test4

all: 		$(PDF_PRJS)
	cd tex_gnuplot && $(MAKE)
	cd metapost && $(MAKE)
	cd texlive_2016_chinese && $(MAKE)

clean:
	rm -f *.pdf *.log *.aux *.toc *.dvi
	cd tex_gnuplot && $(MAKE) clean
	cd metapost && $(MAKE) clean
	cd texlive_2016_chinese && $(MAKE) clean

$(PDF_PRJS): \
%: 		%.tex
	xelatex $< >/dev/null

test: 		test3
	@evince test3.pdf
