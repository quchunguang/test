all:	run

libfoo.so:	foo.c
	gcc -fPIC -shared $< -o $@

democgo:	libfoo.so democgo.go
	go build democgo.go

run:	democgo
	LD_LIBRARY_PATH=. ./democgo

clean:
	-rm -f democgo libfoo.so server client
.PHONY : all run clean
