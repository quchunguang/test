// test.cpp : Defines the entry point for the console application.
//

#include "sense4.h"
#include <stdlib.h>
#include <stdio.h>
#include "common.h"
#include "..\..\inc\sample_26.h"
#include "..\DLLDemo.h"

int main(int argc, char* argv[])
{
	unsigned long dwResult = 0;
	unsigned char plainText[BUFFERLENGTH];
	unsigned char cipher[BUFFERLENGTH];

	// clear text
	memset(plainText, 0, BUFFERLENGTH);
	memcpy(plainText, "12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890", BUFFERLENGTH);

	// test encrypt
	printf("Begin encrypt in TDES_ECB mode...\n");
	memset(cipher, 0, BUFFERLENGTH);
	
	crypto(0, plainText, cipher);
	printf("Success!\nThe cipher:");	
	hexprint(stdout, cipher, BUFFERLENGTH);

	// test decrypt
	printf("Begin decrypt in TDES_ECB mode...\n");
	memset(plainText, 0, BUFFERLENGTH);
	crypto(1, cipher, plainText);
	printf("Success!\nThe plainText:");	
	hexprint(stdout, plainText, BUFFERLENGTH);

	return dwResult;
}

