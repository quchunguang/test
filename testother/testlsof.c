/* testlsof.c */
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
int main(void)
{
        open("/tmp/foo", O_CREAT|O_RDONLY);    /* 打开文件/tmp/foo */
        sleep(1200);                           /* 睡眠1200秒，以便进行后续操作 */
        return 0;
}

