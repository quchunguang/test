all: test1 test test2 test3c test3i
clean:
	rm -f test1 test1.c test test.c test2 test2yy.h test2yy.c test2ll.c test3c test3i test3yy.h test3yy.c test3ll.c *.s *~

test1: 		test1.l
	flex -o test1.c test1.l
	gcc test1.c -o test1 -lfl
test: 		test.l
	flex -o test.c test.l
	gcc test.c -o test
test2: 		test2ll.l test2yy.y
	flex -otest2ll.c test2ll.l
	bison -otest2yy.c test2yy.y -d
	gcc test2yy.c test2ll.c -o test2
test3fb: 	test3ll.l test3yy.y
	flex -o test3ll.c test3ll.l
	bison -o test3yy.c test3yy.y -d
test3c: 	test3fb test3.h compile.c
	gcc test3yy.c test3ll.c compile.c -o test3c
test3i: 	test3fb test3.h interpreter.c
	gcc test3yy.c test3ll.c interpreter.c -o test3i
