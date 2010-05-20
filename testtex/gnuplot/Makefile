PRJS= testgnuplot ibm electron

all: 		$(PRJS) plot1006.x11
clean: 		
	rm -f *.png plot1006.dat

$(PRJS): \
%: 		%.dem
	gnuplot $<	

# plot1006
plot1006.x11: 	plot1006.dem plot1006.dat
	gnuplot $<
plot1006.dat:
	bash plot1006_gendata.sh
