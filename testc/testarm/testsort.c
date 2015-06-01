#include <stdio.h>
#include <stdlib.h>

int compare_int(const void *p1, const void *p2)
{
	int a = *(int *)p1;
	int b = *(int *)p2;
	return a - b;
}

int main(int argc, char const *argv[])
{
	int array[] = { 9, 8, 7, 6, 5, 4, 3, 2, 1, 10, 11, 12, 13, 14, 15 };
	const int len = sizeof(array) / sizeof(int);
	qsort(array, len, sizeof(int), compare_int);
	for (int i = 0; i < len; i++) {
		printf("%d ", array[i]);
	}
	printf("\n");
	int key = 16;
	int *match = bsearch(&key, array, len, sizeof(int), compare_int);
	if (match)
		printf("%d\n", *match);
	else
		printf("Can not find %d\n", key);
	return 0;
}
