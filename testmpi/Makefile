## Before test,
##  $ su - mpiu
##  $ mpdboot -n 2
##  $ mpdtrace
## After test,
##
##

PRJS=cpi cxxpi
all:		$(PRJS)
clean:
	rm -f $(PRJS)
cpi:		cpi.c
	mpicc -o cpi cpi.c
cxxpi:		cxxpi.cxx
	mpic++ -o cxxpi cxxpi.cxx
testcpi:
	mpiexec -n 1 ./cpi
	mpiexec -n 2 ./cpi
testcxxpi:
	mpiexec -n 1 ./cxxpi
	mpiexec -n 2 ./cxxpi
