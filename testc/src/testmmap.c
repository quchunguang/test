/*
 * testmmap.c
 *
 *  Created on: 2011-9-19
 *      Author: qcg
 */

#include <stdlib.h>
#include <stdio.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <unistd.h>
/*
int main(void)
{
	int *p;
	int fd = open("hello", O_RDWR);
	if (fd < 0) {
		perror("open hello");
		exit(1);
	}
	p = mmap(NULL, 6, PROT_WRITE, MAP_SHARED, fd, 0);
	if (p == MAP_FAILED) {
		perror("mmap");
		exit(1);
	}
	close(fd);
	p[0] = 0x35363738;
	munmap(p, 6);
	return 0;
}*/
