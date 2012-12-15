/*
 * main.c
 *
 *  Created on: 2012-5-18
 *      Author: qcg
 */
#include <pthread.h>
#include <stdio.h>
#include <string.h>

#include "testcase.h"

/* Prints x’s to stderr.
 The parameter is unused.
 Does not return.
 */
void* print_xs(void* unused) {
	int n = 10000;
	while (n--)
		fputc('x', stderr);
	return NULL;
}
/* The main program.
 */
int main() {
	pthread_t thread_id;
	char buffer[256];

	/* Create a new thread. The new thread will run the print_xs
	 function. */
	pthread_create(&thread_id, NULL, &print_xs, NULL);
	/* Print o’s continuously to stderr. */
	int n = 10000;
	while (n--)
		//fputc('o', stderr);

	bzero(buffer, 256);
	sprintf(buffer, "%s : %s\n", "AA", "BB");
	printf("%s", buffer);
	testcase();

	return 0;
}
