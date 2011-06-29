#include <stdio.h>

/* getuid() geteuid() */
#include <unistd.h>
#include <sys/types.h>

/* objcopy from linkdata.jpg */
extern char _binary_linkdata_jpg_start[];
extern char _binary_linkdata_jpg_end[];
extern char _binary_linkdata_jpg_size[];
const char *start = _binary_linkdata_jpg_start;
const char *end = _binary_linkdata_jpg_end;
int size = (int)_binary_linkdata_jpg_size;

/* foo.so */
extern void foo();
extern void bar();

int main()
{
	char* str = "Hello World\n";
	printf("uid = %d, euid = %d ", getuid(), geteuid());
	printf("%s",str);

	/* call methods in foo.so */
	foo();
	bar();

	/* recall data imported by objcopy */
	printf("Size of linkdata.jpg=%d\n", size);
	return 0;
}
