#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
	int fd = open("/dev/tty", O_RDWR);
	write(fd, "hello\n", 6);
	exit(0);
}
