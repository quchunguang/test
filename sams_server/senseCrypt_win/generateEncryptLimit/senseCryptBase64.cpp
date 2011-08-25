// senseCryptBase64.cpp : 定义控制台应用程序的入口点。
//

#include "stdafx.h"
#include <string.h>

#include "base64.h"
#include "crypt2.h"

#define BUFFERLENGTH 200

int ucharlen(unsigned char* input, int total)
{
	while(!input[--total]);
	return ++total;
}

// cmdline:  $prog_name type key(16) from from_len(<200)
// type:     0 encrypt
//           1 decrypt
// stdout:   output string
int  main(int argc, char* argv[])
{
	int type;
	unsigned char ukey[17];
	unsigned char from[BUFFERLENGTH];
	int from_len;
	unsigned char to[BUFFERLENGTH];
	char* to_base64 = NULL;

	//process arguments
	if(argc != 5) {
		printf("Usage: $prog_name type key(16) from from_len(<200)\n");
		printf("Example:\nc:\> senseCryptBase64 0 \"NsZnUpqehTUZwCkb\" \"XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX\" 36");
		return 1;					// 1: error number of arguments
	}

	from_len = atoi(argv[4]);
	type = atoi(argv[1]);
	memset(ukey, 0, 17);
	memcpy(ukey, argv[2], 16);
	memset(from, 0, BUFFERLENGTH);
	memcpy(from, argv[3], from_len);
	memset(to, 0, BUFFERLENGTH);

	TDES(ukey, 1, to, from, from_len);
	to_base64 = base64_encode(to, ucharlen(to, BUFFERLENGTH));
	printf("%s", to_base64);
	free(to_base64);

	return 0;						// 0: ok
}
