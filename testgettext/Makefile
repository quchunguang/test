programs 	= testgettext testgettext2

.PHONY: 	all clean
all: 	$(programs)
clean:
	rm $(programs); find . -name "*~" -exec rm {} \;

$(programs): \
%: 		%.c
	$(CC) -o $@ $<
