BOOST_INCLUDE=~/dev/prj/kernel/boost_1_44_0
BOOST_LIBRARY=$(BOOST_INCLUDE)/stage/lib
PROJECTS=lambda regex

.PHONY: clean all
all: $(PROJECTS)
clean:
	rm -f $(PROJECTS)
lambda: lambda.cc
	g++ -I $(BOOST_INCLUDE) lambda.cc -o lambda
regex: regex.cc
	g++ -I $(BOOST_INCLUDE) -L $(BOOST_LIBRARY) -lboost_regex regex.cc -o regex
	#g++ -I $(BOOST_INCLUDE) regex.cc -o regex $(BOOST_LIBRARY)/libboost_regex.a
