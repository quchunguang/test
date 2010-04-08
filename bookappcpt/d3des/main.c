#include <stdio.h>
#include "d3des.h"

#define 	LINE_LEN 	8

int main( int argc, char **argv )
{
	FILE *fp;
	FILE *fp_out;
	char line[LINE_LEN];
	char outline[LINE_LEN];
	char *ret;	
	unsigned char key[24];

	make3key(argv[1], key);
	des3key(key, DE1);

	fp = fopen(argv[2], "r");
	fp_out = fopen(argv[3], "w+");
	ret = fgets(line, LINE_LEN, fp);
	while(ret != NULL){
		des(line, outline);
		fputs(outline, fp_out);	
		ret = fgets(line, LINE_LEN, fp);
	}
	return 0;
}
