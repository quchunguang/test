all: 	latex_cn_sample xelatex_cn_sample

clean:
	rm -f *.pdf *.log *.aux *.toc *.dvi GEN_FONT.BAT

latex_cn_sample: %.tex
	pdflatex $< >/dev/null

xelatex_cn_sample: %.tex
	xelatex $< >/dev/null
