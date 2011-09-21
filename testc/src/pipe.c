/*
 * pipe.c
 *
 *  Created on: 2011-9-19
 *      Author: qcg
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <wait.h>
#define MAXLINE 80
/*
int main(void) {
	int n;
	int fd[2];
	pid_t pid;
	char line[MAXLINE];

	if (pipe(fd) < 0) {
		perror("pipe");
		exit(1);
	}
	if ((pid = fork()) < 0) {
		perror("fork");
		exit(1);
	}
	if (pid > 0) { // parent
		close(fd[0]);
		write(fd[1], "hello world\n", 12);
		wait(NULL);
	} else { // child
		close(fd[1]);
		n = read(fd[0], line, MAXLINE);
		write(STDOUT_FILENO, line, n);
	}
	return 0;
}
*/
