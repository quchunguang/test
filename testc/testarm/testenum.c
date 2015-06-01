#include <stdio.h>
#include <math.h>

enum color { black = 0,
	brown, red, orange, yellow, green, blue, purple, gray, white,
	gold = -1, sliver = -2, none = -3
};

int main(int argc, char const *argv[])
{
	int resister[] = { brown, white, sliver, gold };
	double value = (resister[0] * 10 + resister[1]) * pow(10, resister[2]);
	printf("%3.2e\n", value);
	return 0;
}
