#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <string.h>

typedef struct {
	double x;
	double y;
} xyt;

typedef struct {
	int no;
	int no2;
	xyt xy;
} tnt;

int main(int argc, char *argv[])
{
	tnt tn = { 1, 2, {3.1, 4.2} };
	int i;
	char *numstr = "23.456";
	double num = atof(numstr);
	printf("Convert: %f\n", num);
	for (i = 0; i < argc; i++) {
		printf("Arg %d = %s\n", i, argv[i]);
	}

	printf("(%lf,%lf)\n", tn.xy.x, tn.xy.y);

	char *buffer;
	buffer = (char *)malloc(80);
	strncpy(buffer, "haha\ngaga\n", 80);
	printf(buffer);

	FILE *pfile = fopen("log.txt", "w");
	if (!pfile) {
		printf("error: can not open file\n");
	}
	fprintf(pfile, buffer);
	fclose(pfile);

	printf("%d\n", sizeof(buffer));
	free(buffer);

	char str[] = "The quick brown fox";	// The string to be searched
	char ch = 'q';		// The character we are looking for
	char *pGot_char = NULL;	// Pointer initialized to NULL
	pGot_char = strchr(str, ch);	// Stores address where ch is found
	printf("%s  %d\n", pGot_char, sizeof(str));

	char text[] = "Every dog has his day";
	char word[] = "dog";
	char *pFound = NULL;
	pFound = strstr(text, word);
	printf("%s\n", pFound);

	printf("Received: %c\n", getchar());

	return 0;
}
