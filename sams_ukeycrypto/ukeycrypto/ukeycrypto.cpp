// ukeycrypto.cpp : 定义控制台应用程序的入口点。
//

#include "stdafx.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "crypt2.h"
#include "base64.h"

#define BUFFERLENGTH 200

//int _tmain(int argc, _TCHAR* argv[])
//{
//	unsigned char key[16];
//	unsigned char input[BUFFERLENGTH];
//	unsigned char encode[BUFFERLENGTH];
//	unsigned char decode[BUFFERLENGTH];
//	char *encode_base64;
//	unsigned char *decode_base64;
//	int retlen;
//
//	memset(input, 0, BUFFERLENGTH);
//	memset(encode, 0, BUFFERLENGTH);
//	memset(decode, 0, BUFFERLENGTH);
//	memcpy(key, "1234567890123456", 16);
//	memcpy(input, "1234567890abcdef", BUFFERLENGTH);
//
//	//encode
//	TDES(key, 1, encode, input, BUFFERLENGTH);
//	encode_base64 = base64_encode(encode, BUFFERLENGTH);
//
//	// decode
//	decode_base64 = base64_decode(encode_base64, &retlen);
//	TDES(key, 0, decode, decode_base64, BUFFERLENGTH);
//
//	free(encode_base64);
//	free(decode_base64);
//	return 0;
//}

int  _tmain(int argc, char* argv[])
{
	int retlen;
	unsigned char *uencode;
	unsigned char udecode[BUFFERLENGTH];
	unsigned char ukey[16];
	memset(udecode, 0, BUFFERLENGTH);
	memset(ukey, 0, 16);
	int ret = 0;

	//process arguments
	char *encode_base64 = argv[1];	// length bigger than BUFFERLENGTH
	char *key = argv[2];			// length 16
	char *random = argv[3];			// length 16
	if(argc != 4) {
		return 1;					// error number of arguments
	}

	memcpy(ukey, key, 16);
	uencode = base64_decode(encode_base64, &retlen);
	TDES(ukey, 0, udecode, uencode, retlen);

	free(uencode);
	ret = memcmp(udecode, random, 16);
	return (ret > 0) ? -ret: ret;	// return 0 or less than 0
}