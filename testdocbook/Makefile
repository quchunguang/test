OBJECTS = test.html docbook.html

PARAM = /usr/share/xml/docbook/stylesheet/nwalsh/xhtml/docbook.xsl
COMPILER = xsltproc

.PHONY: all clean
all: $(OBJECTS)
clean:
	rm -rf *.html

test.html: test.xml
	$(COMPILER) -o $@ $(PARAM) $<

docbook.html: docbook.xml
	$(COMPILER) -o $@ $(PARAM) $<
