C_PRJS = sampletime sample1
CPP_PRJS = sampleclock
CC = gcc
CPP = g++
CFLAGS = -g -Wall -pg -fprofile-arcs -ftest-coverage

all: 		$(C_PRJS) $(CPP_PRJS)
clean: 		cleantest
	rm -f *.o $(C_PRJS) $(CPP_PRJS)

$(C_PRJS): \
%: 		%.c
	$(CC) $(CFLAGS) -o $@ $<
$(CPP_PRJS): \
%: 		%.cc
	$(CPP) $(CFLAGS) -o $@ $<

test: 		sample1
	@./sample1
	@gprof -b ./sample1 > sample1.gprof
	@kprof sample1.gprof
	#@gcov sample1.c
	@lcov -d . -c -o sample1.info
	@genhtml -o sample1.lcov sample1.info
	@firefox sample1.lcov/index.html
cleantest:
	rm -rf gmon.out *.gprof *.gcno *.gcda *.info sample1.lcov/
