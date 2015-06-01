#include <stdio.h>
#include <math.h>


int main()
{
    printf("Current function is %s\n", __func__);
    double c = hypot(3.3f, 4.4f);
    printf("%lf\n", c);

    return 0;
}
