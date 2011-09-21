/*
 * daemon.c
 *
 *  Created on: 2011-9-20
 *      Author: qcg
 * Same as daemon(3)
 */

#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

void daemonize(void) {
	pid_t pid;

	/*
	 * Become a session leader to lose controlling TTY.
	 */
	if ((pid = fork()) < 0) {
		perror("fork");
		exit(1);
	} else if (pid != 0) /* parent */
		exit(0);
	setsid();

	/*
	 * Change the current working directory to the root.
	 */
	if (chdir("/") < 0) {
		perror("chdir");
		exit(1);
	}

	/*
	 * Attach file descriptors 0, 1, and 2 to /dev/null.
	 */
	close(0);
	open("/dev/null", O_RDWR);
	dup2(0, 1);
	dup2(0, 2);
}
/*
int main(void) {
	daemonize();
	while (1)
		;
	return 0;
}
*/
