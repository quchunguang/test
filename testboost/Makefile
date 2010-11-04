# Before run `make test`, this may be required:
# $ export LD_LIBRARY_PATH=$(BOOST_LIBRARY)

BOOST_INCLUDE=~/dev/prj/boost
BOOST_LIBRARY=$(BOOST_INCLUDE)/stage/lib
PROJECTS=lambda regex foreach

.PHONY: 	clean all
all: $(PROJECTS)
clean:
	rm -f $(PROJECTS)
lambda: 	lambda.cc
	g++ -I $(BOOST_INCLUDE) lambda.cc -o lambda
regex: 		regex.cc
	g++ -I $(BOOST_INCLUDE) -L $(BOOST_LIBRARY) -lboost_regex regex.cc -o regex
	#g++ -I $(BOOST_INCLUDE) regex.cc -o regex $(BOOST_LIBRARY)/libboost_regex.a
foreach: 	foreach.cc
	g++ -I $(BOOST_INCLUDE) -o $@ $<

test: 		regex
	./regex < ./jayne.txt
