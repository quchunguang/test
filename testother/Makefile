################################################
# @project: 	Common Makefile 
# @version: 	1.1
# @author: 	Kevin qu
# @right: 	ALL RIGHT RESERVED
# @change log: 	2010/01/17 v1.0 release
#              	2010/02/04 v1.1 +Coverage Test
################################################

################################################
# NOTES
# 1 Debug: add -g in CFLAGS
# 2 Coverage Test: add -fprofile-arcs -ftest-coverage in ADDFLAGS
#   after compile
#   run `gcov *.c` one by one and view every *.gcov file
#   or
#   run `lcov -d . -c -o testother.info` and `genhtml -o result testother.info` and view result
# 3 Demonstration of strace:
#   $ ./testlsof &
#   [1] 3125
#   $ strace -o lsof.strace lsof -p 3125
#   $ grep '/tmp/foo' lsof.strace
#   readlink("/proc/3125/fd/3", "/tmp/foo", 4096) = 8
#   $ ls -l /proc/14432/fd | grep foo

CFLAGS 		= -Wall -ansi -g
ADDFLAGS 	= -fprofile-arcs -ftest-coverage # for Coverage Test
CFLAGS 	       += $(ADDFLAGS)

sources  	= testuid.c \
		  amicable-numbers.c \
		  testio.c \
		  randomgraph.c \
		  testlsof.c
objects 	= $(sources:.c=.o)
modules 	= #myproc.so
projects 	= testuid \
		  amicable-numbers \
		  testio \
		  randomgraph \
		  testlsof

.PHONY: 	all clean
all: 		$(objects) $(modules) $(projects)
clean: 		
	rm -f $(modules) $(projects) *~ *.o *.d *.gcno *.gcda

cleanall:
	rm -rf result/
	rm *~ *.o *.d *.gcda *.gcno cscope.* *.log *.bak tags filenametags

# objects
sinclude $(sources:.c=.d)
%.d: 	%.c
	$(CC) -MM $(CPPFLAGS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	rm -f $@.$$$$

# modules
$(modules): \
%.so: 		%.c
	$(CC) $(CFLAGS) -fPIC -shared -o $@ $<

# projects
#################Start add######################
testuid: 		testuid.o
	$(CC) $(ADDFLAGS) -o $@ $<
amicable-numbers: 	amicable-numbers.o
	$(CC) $(ADDFLAGS) -lm -o $@ $<
testio:  		testio.o
	$(CC) $(ADDFLAGS) -o $@ $<
randomgraph: 		randomgraph.o
	$(CC) $(ADDFLAGS) -o $@ $<
testlsof: 		testlsof.o
	$(CC) $(ADDFLAGS) -o $@ $<

#################End add########################

# link DSO using -W1,-rpath,.
# link DSO using -Wl,export-dynamic
#myprog: 	$(OBJECTS) myproc.so
#	$(CC) $(CFLAGS) -Wl,-rpath,.,-rpath,$(HOME)/lib -o $@ $^ -ldl
