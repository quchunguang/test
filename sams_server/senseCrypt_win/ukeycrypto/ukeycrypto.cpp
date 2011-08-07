// ukeycrypto.cpp : 定义控制台应用程序的入口点。
//

#include "stdafx.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "crypt2.h"

#define BUFFERLENGTH 200

/*
int main(int argc, char* argv[])
{
	unsigned char key[16];
	unsigned char input[BUFFERLENGTH];
	unsigned char encode[BUFFERLENGTH];
	unsigned char decode[BUFFERLENGTH];
	char *encode_base64;
	unsigned char *decode_base64;
	int retlen;

	memset(input, 0, BUFFERLENGTH);
	memset(encode, 0, BUFFERLENGTH);
	memset(decode, 0, BUFFERLENGTH);
	memset(key, 0, 16);
	memcpy(key, "1234567890123456", 16);
	memcpy(input, "Cd9Za6Xgq0SfGbi8", 16);

	// encode
	TDES(key, 1, encode, input, BUFFERLENGTH);
	encode_base64 = base64_encode(encode, BUFFERLENGTH);

	// decode
	decode_base64 = base64_decode(encode_base64, &retlen);
	TDES(key, 0, decode, decode_base64, retlen);

	// output
	printf("key=%s\n", key);
	printf("input=%s\n", input);
	printf("encode=");
	printf("\nencode_base64=%s\n", encode_base64);
	printf("decode_base64=%s\n", decode_base64);
	printf("decode=%s\n", decode);

	free(encode_base64);
	free(decode_base64);
	return 0;
}

*/

unsigned char hex2uchar(char c)
{
    if( c >= '0' && c <= '9')
    {
        return (unsigned char) (c - 48);
    }
    else if( c >= 'A' && c <= 'F')
    {
        return (unsigned char) (c - 65 + 10);
    }
    else if( c >= 'a' && c <= 'f')
    {
        return (unsigned char) (c - 97 + 10);
    }
    else
    {
        return 0;
    }
}

void hex2bin(char *client_hex, unsigned char uclient[])
{
	int i;
	unsigned char a, b;
	for(i = 0; i < 32; i += 2) {
		a =  hex2uchar(client_hex[i]);
        	b =  hex2uchar(client_hex[i + 1]);
        	uclient[i / 2] = (unsigned char)(a << 4 | b);
	}
}

int  main(int argc, char* argv[])
{
	unsigned char urandom[BUFFERLENGTH];
	unsigned char uencode[BUFFERLENGTH];
	unsigned char ukey[17];
	unsigned char uclient[16];
	memset(urandom, 0, BUFFERLENGTH);
	memset(uencode, 0, BUFFERLENGTH);
	memset(ukey, 0, 17);

	//process arguments
	if(argc != 4) {
		return 4;			// 2: error number of arguments
	}
	char *client_hex = argv[1];		// length bigger than BUFFERLENGTH
	memcpy(ukey, argv[2], 16);
	memcpy(urandom, argv[3], 16);

	TDES(ukey, 1, uencode, urandom, BUFFERLENGTH);
	hex2bin(client_hex, uclient);

	return (memcmp(uencode, uclient, 16) == 0 ? 0 : 5);		// 1: error compare
}