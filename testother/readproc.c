#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int main(int args,char *argv[])
{
	FILE *fp;
	char path[80];
	unsigned char ch;

	if(args != 2){
		printf("format: readproc pid\n");
		return -1;
	}
	sprintf(path,"/proc/%s/cmdline",argv[1]);
	printf("%s\n", path);
	if((fp=fopen(path,"r"))==NULL)
	{
		perror("fopen");
		return 0;
	}
	while(!feof(fp)) {
		ch=fgetc(fp);
		printf("%c %d\n",ch,ch);
	}
	fclose(fp);
	return 0;
}
