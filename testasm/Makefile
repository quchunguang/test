all: 	test
clean:
	rm -f hello hello.o findmax findmax.o
findmax: 	findmax.s
	as -o findmax.o $<
	ld -o $@ findmax.o
hello: 	hello.s
	as -o hello.o $<
	ld -o $@ hello.o
test:   hello
	./hello
