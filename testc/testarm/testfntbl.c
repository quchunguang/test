#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define PI              3.14159
#define STEP            (PI / 8)
#define AMPLITUTE       1.0
#define ATTENUATION     0.1
#define DF(x)           exp(-ATTENUATION*(x))
#define FUNC(x)         (DF(x)*AMPLITUTE*cos(x))

#define STR(s)          #s
#define XSTR(s)         STR(s)

int main(int argc, char const *argv[])
{
        printf("FUNC(x) = %s\n", XSTR(FUNC(x)));
        printf("\n %10s %25s\n", "x", STR(y = FUNC(x)));
        printf("-----------------------------------------\n");
        for (double x = 0.0; x < 2 * PI + STEP / 2; x += STEP)
                printf("%15f %20f\n", x, FUNC(x));

        return 0;
}
