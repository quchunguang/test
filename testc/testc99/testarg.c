#include <stdarg.h>
#include <stdio.h>

#define EPSINON 1e-10

double average(double v, ...)
{
	va_list parg;
	double sum = v;
	int n = 1;
	double vv = 0.0;
	va_start(parg, v);
	while ((vv = va_arg(parg, double)) > EPSINON || vv < -EPSINON) {
		n++;
		sum += vv;
	}
	va_end(parg);
	return sum / (double)n;
}

int main()
{
	printf("average = %f\n\n", average(1.0, -1.6));
	return 0;
}
