all: 	test
clean:
	rm -f hello hello.o
hello: 	hello.s
	as -o hello.o $<
	ld -o $@ hello.o
test:   hello
	./hello
