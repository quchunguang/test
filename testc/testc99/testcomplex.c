#include <complex.h>
#include <stdio.h>

int main(int argc, char const *argv[])
{
	double complex z = 1.0 + 2.0 * I;
	z *= I;
	printf("z = %f + %fi\n", creal(z), cimag(z));
	printf("z = %f * exp(%fi)\n", cabs(z), carg(z));

	double complex conjz = conj(z);
	printf("conj(z) = %f + %fi\n", creal(conjz), cimag(conjz));

	return 0;
}
