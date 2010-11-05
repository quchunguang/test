#include <string>             // string
#include <list>               // list
#include <algorithm>          // for_each()
#include <vector>             // vector
#include <iostream>           // cout
#include <boost/foreach.hpp>  // BOOST_FOREACH()
using namespace std;

struct MY_FUNC : public unary_function<int,void> {
	public:
		void operator() (int elem)
		{
			cout << elem;
		}
};

int main()
{
	// string
	string hello( "Hello, world!" );

	// list
	list<int> lst;
	lst.push_back(1);
	lst.push_back(2);
	lst.push_back(3);

	// vector
	vector<int> vec;
	vec.push_back(1);
	vec.push_back(2);
	vec.push_back(3);

	BOOST_FOREACH( char ch, hello ) {
		cout << ch;
	}

	for_each(lst.begin(), lst.end(), MY_FUNC());

	BOOST_FOREACH( int i, lst ) {
		cout << i;
	}

	return 0;
}
