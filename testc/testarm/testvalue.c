#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <stddef.h>
#include <assert.h>
#include <malloc.h>

typedef struct {
        long key;
        int value;
} Data_t;

typedef struct {
        int len;
        float array[]; // c99 flexible array member
} DynArray_t;

struct CharColor {
        unsigned fg:4, bg:3, bl:1;
} attribute = {12, 1, 0};

double add(int n, ...)
{
        double sum = 0.0;
        va_list argptr;
        va_start(argptr, n);
        for (int i = 0; i < n; ++i)
                sum += va_arg(argptr, double);
        va_end( argptr );
        return sum;
}

// c99 declare var array with star mark
double maximum(int nrows, int ncols, double matrix[*][*]);

void valarr(double a[], int n) {
        double b[2 * n];                // c99 val-array
        int m = sizeof(b) / sizeof(*b); // c99 run-time sizeof
        printf("m = %d, n = %d\n", m, n);
        for (int i = 0; i < n; i++) {    // c99 for-loop declare
                b[2*i] = a[i];
                b[2*i + 1] = a[i];
        }
}

// c99 inline: common defined in head file
inline int iMax(int a, int b) { return a > b ? a : b; }

long double factorial(register unsigned int n)
{
        long double f = 1;
        while (n > 1) {
                f *= n--;
        }
        return f;
}

// printArray only averable in this file
static void printArray(const float array[], int n) {
        for (int i=0; i < n; i++) {
                printf("%12.5f", array[i]);
                if(i % 5 == 4) putchar('\n');
        }
        if(n % 5 != 0) putchar('\n');
}

void addArray(register float a1[], register const float a2[5], int len)
// a1, a2 can be change. at least 5 element in a2. same as:
// void addArray(register float *a1, register const float *a2, int len)
{
        register float *end = a1 + len;
        for (; a1 < end; ++a1, ++a2) {
                *a1 += *a2;
        }
}

// c99 var array
double maximum(int nrows, int ncols, double matrix[nrows][ncols])
{
        double max = matrix[0][0];
        for (int r = 0; r < nrows; ++r)
                for (int c = 0; c < ncols; ++c)
                        if (max < matrix[r][c])
                                max = matrix[r][c];
        return max;
}

long *binarySearch(long val, long array[], int n)
{
        int m = n / 2;
        if (n <= 0) return NULL;
        if (val == array[m]) return array + m;
        if (val < array[m]) return binarySearch(val, array, m);
        else return binarySearch(val, array + m + 1, m - 1);
}

int main(int argc, char const *argv[])
{
        double *p = (double[]) {1.2, 2.4, 3.6}; // c99 compound literal
        printf("v = %lf\n", *(p+2));
        valarr((double []){1.1, 2.2}, 2);
        printArray((float []){1.1, 1.2, 1.3, 1.1, 1.2, 1.3, 1.1, 1.2, 1.3}, 9);
        float a1[] = {1.1, 1.2, 1.3, 1.1};
        float a2[] = {1.1, 1.2, 1.3, 1.1};
        addArray(a1, a2, 4);
        printArray(a1, 4);
        printf("sum = %lf\n", add(3, 1.1, 2.2, 3.3));

        enum {A_SIZE=20};
        int a[A_SIZE] = {1, 2, [A_SIZE/2] = 1, 2}; // c99 array index
        printf("a[11] = %d\n", a[11]);

        Data_t * restrict rPtr = malloc(sizeof(Data_t)); // c99 restrict: can only change value of object through this ptr
        rPtr->key = 1;
        rPtr->value = 101;

        int *pValue = (int *)((char *)rPtr + offsetof(Data_t, value)); // c99 offsetof/sizeof is recommended
        printf("rPtr->value = %d\n", *pValue);

        assert(sizeof(DynArray_t) == offsetof(DynArray_t, array)); // c99 flexible array member are not count in
        DynArray_t *pda = malloc(sizeof(DynArray_t) + 10*sizeof(float));
        pda->array[9] = 9; // last element of flexible array member

        printf("add(n, ...) = %lf\n", add(3, 1.1, 2.2, 3.3));

        return EXIT_SUCCESS;
}
