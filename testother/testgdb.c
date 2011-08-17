#include <stdio.h>
#include <wchar.h>

int my_function(wchar_t *a)
{
	return wprintf(a);
}
int main()
{
	return my_function(L"hi, World!\n");
}
