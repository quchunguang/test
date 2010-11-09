## Before test,
##  $ su - mpiu
##  $ mpdboot -n 2
##  $ mpdtrace
## After test,
##  $ mpdallexit

PRJS=cpi cxxpi
all:		$(PRJS)
clean:
	rm -f $(PRJS)
cpi:		cpi.c
	mpicc -o cpi cpi.c
cxxpi:		cxxpi.cxx
	mpic++ -o cxxpi cxxpi.cxx
testcpi:	cpi
	mpiexec -n 1 ./cpi
	mpiexec -n 2 ./cpi
testcxxpi:	cxxpi
	mpiexec -n 1 ./cxxpi
	mpiexec -n 2 ./cxxpi
