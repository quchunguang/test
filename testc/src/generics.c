/*
 * generics.c
 *
 *  Created on: 2011-9-23
 *      Author: qcg
 */

#include <stdio.h>

typedef int (*cmp_t)(void *, void *);
extern void *max(void *data[], int num, cmp_t cmp);

/* generics.c */
void *max(void *data[], int num, cmp_t cmp) {
	int i;
	void *temp = data[0];
	for (i = 1; i < num; i++) {
		if (cmp(temp, data[i]) < 0)
			temp = data[i];
	}
	return temp;
}

/* main.c */

typedef struct {
	const char *name;
	int score;
} student_t;

int cmp_student(void *a, void *b) {
	if (((student_t *) a)->score > ((student_t *) b)->score)
		return 1;
	else if (((student_t *) a)->score == ((student_t *) b)->score)
		return 0;
	else
		return -1;
}
/*
int main(void) {
	student_t list[4] = { { "Tom", 68 }, { "Jerry", 72 }, { "Moby", 60 }, {
			"Kirby", 89 } };
	student_t *plist[4] = { &list[0], &list[1], &list[2], &list[3] };
	student_t *pmax = max((void **) plist, 4, cmp_student);
	printf("%s gets the highest score %d\n", pmax->name, pmax->score);

	return 0;
}
*/
