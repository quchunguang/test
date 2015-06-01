#include <wchar.h>
#include <locale.h>
#include <stdio.h>

int main()
{
	char s[] = "这是一段中文\n";
	printf("%s", s);
	return 0;
}
