## Before run `make test`, this may be required:
## $ export LD_LIBRARY_PATH=$(BOOST_LIBRARY)
## or run as root,
## # echo "/home/qcg/dev/prj/boost/stage/lib" > /etc/ld.so.conf.d/boost.conf
## # ldconfig -v
PROJECTS=lambda regex foreach

BOOST_INCLUDE=~/dev/prj/boost
BOOST_LIBRARY=$(BOOST_INCLUDE)/stage/lib
CPP=g++ -Wall -ansi -g

.PHONY: 	clean all
all: $(PROJECTS)
clean:
	rm -f $(PROJECTS)
lambda: 	lambda.cc
	$(CPP) -I $(BOOST_INCLUDE) -o $@ $<
regex: 		regex.cc
	$(CPP) -I $(BOOST_INCLUDE) -L $(BOOST_LIBRARY) -lboost_regex -o $@ $<
	#$(CPP) -I $(BOOST_INCLUDE) $(BOOST_LIBRARY)/libboost_regex.a -o $@ $<
foreach: 	foreach.cc
	$(CPP) -I $(BOOST_INCLUDE) -o $@ $<

test: 		$(PROJECTS)
	echo "1 2 3" | ./lambda
	./regex < ./jayne.txt
	./foreach
