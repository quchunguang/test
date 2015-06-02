#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, char const *argv[])
{
	double sigma = 1.0;	// 标准差
	double bound = 1.125;
	double probability = 0.5 * erf(bound / (sigma * sqrt(2.0)));	// N ~ P[0, bound]
	printf("N(0,1) ~ P[0, 1.125] = %lf\n", probability);
	return 0;
}
