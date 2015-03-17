OBJECTS 	= genpdf.pdf
R 			= R
PDFVIEWER	= evince

.PHONY: 	all clean test

all:
	@echo "Generate target seperated."
	@echo "'make list' for targets averable."

clean:
	rm -f $(OBJECTS) *.Rout

list:
	@grep '^[^#[:space:]].*:' Makefile

genpdf.pdf: 	genpdf.R
	$(R) CMD BATCH $<
	$(PDFVIEWER) $@

test:	test.R
	$(R) CMD BATCH $<
