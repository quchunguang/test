/* randomgraph.c Generate a graph of random data in pbm type
 * gcc -o randomgraph randomgraph.c
 * ./randomgraph > randomgraph.out.pbm
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define SIZE 		128

int main()
{
	int i,j;
	int map[SIZE][SIZE];
	memset(map,0,sizeof(map));
	for (i = 0; i < 1000; i++) {
		map[rand() % SIZE][rand() % SIZE] = 1;
	}

	printf("P1\n%d %d\n", SIZE, SIZE); /* generate pbm head */
	for (i = 0; i < SIZE; i++) {
		for (j = 0; j < SIZE; j++) {
			printf("%d", map[i][j]);
			/*printf("%d ", map[i][j]);*/
		}
		printf("\n");
	}
	return 0;
}
