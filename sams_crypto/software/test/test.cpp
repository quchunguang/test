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
	unsigned char random[17];
	unsigned char encryptrandom[33];

	// clear text
	memset(plainText, 0, BUFFERLENGTH);
	memcpy(plainText, "select * from t0a12 where", BUFFERLENGTH);

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
	printf("%s",plainText);

	// test encryptrand
	memset(random, 0, 17);
	memset(encryptrandom, 0, 33);
	memcpy(random, "vasse4sdf034tf43", 16);
	encryptrand(random, encryptrandom);
	hexprint(stdout, random, 16);
	printf("\n%s\n", encryptrandom);
	return dwResult;
}

