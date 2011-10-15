/*
 ============================================================================
 Name        : testrsa.c
 Author      : Kevin Qu
 Version     :
 Copyright   : Copyright by Kevin Qu, All rights reserved.
 Description : rsa encrypt demo with openssl
 ============================================================================
 */
#include <stdio.h>
#include <string.h>

#include <openssl/rsa.h>
#include <openssl/pem.h>

#include "testrsa.h"

int generate_key() {
	RSA *pRsa;
	int bits = 1024, iret;
	unsigned long e = RSA_3;
	FILE *pfprivatekey, *pfpublickey;

	if ((pfpublickey = fopen(RSA_PUBLIC_KEY_NAME, "wb")) == NULL)
	{
		printf("\nopen file [ %s ] error!\n\n", RSA_PUBLIC_KEY_NAME);
		return FAIL;
	}

	if ((pfprivatekey = fopen(RSA_PRIVATE_KEY_NAME, "wb")) == NULL)
	{
		printf("\nopen file [ %s ] error!\n\n", RSA_PRIVATE_KEY_NAME);
		return FAIL;
	}

	pRsa = RSA_generate_key(bits, e, NULL, NULL);

	iret = RSA_check_key(pRsa);
	if (iret != 1) {
		printf("key error! \n");
		return FAIL;
	}

	PEM_write_RSAPublicKey(pfpublickey, pRsa);
	PEM_write_RSAPrivateKey(pfprivatekey, pRsa, NULL, NULL, bits, NULL,
			NULL);

	RSA_free(pRsa);
	fclose(pfpublickey);
	fclose(pfprivatekey);

	return SUCCESS;
}

int RSA_Encrypt(char *pszSource_file, char *pszObject_file) {
	FILE *pfPlain, *pfCipher;
	unsigned char *szPlainBlock, *szCipherBlock;
	RSA *pRsa;
	int iret = -1, flen, icount = -1, itail = -1;

	if ((pfPlain = fopen(pszSource_file, "rb")) == NULL)
	{
		printf("\nopen file [ %s ] error!\n\n", pszSource_file);
		return FAIL;
	}
	if ((pfCipher = fopen(pszObject_file, "wb")) == NULL)
	{
		printf("\nopen file [ %s ] error!\n\n", pszObject_file);
		return FAIL;
	}
	pRsa = RSA_new();

	pRsa = RSA_read_publickey(RSA_PUBLIC_KEY_NAME);
	pRsa = RSA_read_privatekey(RSA_PRIVATE_KEY_NAME);
	iret = RSA_check_key(pRsa);
	if (iret != 1) {
		printf("key error! \n");
		return FAIL;
	}

	flen = RSA_size(pRsa);
	itail = flen - 11;

	szPlainBlock = (unsigned char*) malloc(BN_num_bytes(pRsa->n));
	szCipherBlock = (unsigned char*) malloc(BN_num_bytes(pRsa->n));

	printf("RSA_Encrypt begin ......\n");
	while (!feof(pfPlain)) {

		if ((icount = fread(szPlainBlock, sizeof(char),
				RSA_size(pRsa) - 11, pfPlain)) == itail) {
			iret = RSA_public_encrypt(RSA_size(pRsa) - 11,
					szPlainBlock, szCipherBlock, pRsa,
					RSA_PKCS1_PADDING);
			if (iret < 0) {
				printf("Encrypt failed! \n");
				return FAIL;
			}
			fwrite(szCipherBlock, sizeof(char), flen, pfCipher);
		}
	}

	if (icount) {

		memset(szPlainBlock + icount, '\0', itail - icount);

		szPlainBlock[itail - 1] = itail - icount;
		iret = RSA_public_encrypt(RSA_size(pRsa) - 11, szPlainBlock,
				szCipherBlock, pRsa, RSA_PKCS1_PADDING);
		if (iret < 0) {
			printf("Encrypt failed! \n");
			return FAIL;
		}
		fwrite(szCipherBlock, sizeof(char), flen, pfCipher);
	}

	free(szPlainBlock);
	free(szCipherBlock);

	szPlainBlock = NULL;
	szCipherBlock = NULL;

	fclose(pfPlain);
	fclose(pfCipher);

	RSA_free(pRsa);

	printf("RSA_Encrypt OK!\n");
	return SUCCESS;

}

int RSA_Decrypt(char *pszSource_file, char *pszObject_file) {
	FILE *pfPlain, *pfCipher;
	int iret, times = 0, flen = 0, icount = -1, itail;
	long lFileSize;
	unsigned char *szPlainBlock, *szCipherBlock;
	RSA *pRsa;

	if ((pfPlain = fopen(pszObject_file, "wb")) == NULL)
	{
		printf("\nopen file [ %s ] error!\n=\n", pszObject_file);
		return FAIL;
	}
	if ((pfCipher = fopen(pszSource_file, "rb")) == NULL)
	{
		printf("\nopen file [ %s ] error!\n\n", pszSource_file);
		return FAIL;
	}

	pRsa = RSA_new();

	pRsa = RSA_read_privatekey(RSA_PRIVATE_KEY_NAME);

	iret = RSA_check_key(pRsa);
	if (iret != 1) {
		printf("key error! \n");
		return FAIL;
	}

	fseek(pfCipher, 0, SEEK_END);
	lFileSize = ftell(pfCipher);
	rewind(pfCipher);

	flen = RSA_size(pRsa);
	itail = flen - 11;

	szPlainBlock = (unsigned char *) malloc(BN_num_bytes(pRsa->n));
	szCipherBlock = (unsigned char *) malloc(BN_num_bytes(pRsa->n));

	printf("RSA_Decrypt begin ......\n");
	while (1) {
		fread(szCipherBlock, sizeof(char), flen, pfCipher);
		iret = RSA_private_decrypt(flen, szCipherBlock, szPlainBlock,
				pRsa, RSA_PKCS1_PADDING);
		if (iret < 0) {
			printf("RSA_private_decrypt err!\n");
			return FAIL;
		}
		times += flen;
		if (times < lFileSize) {
			fwrite(szPlainBlock, sizeof(char), iret, pfPlain);
		} else {
			break;
		}
	}

	if (szPlainBlock[itail - 1] < flen) {
		for (icount = flen - szPlainBlock[itail - 1];
				icount < itail - 1; icount++) {
			if (szPlainBlock[icount] != '\0') {
				break;
			}
		}
	}
	if (icount == itail - 1) {
		fwrite(szPlainBlock, sizeof(char),
				iret - szPlainBlock[itail - 1], pfPlain);
	} else {
		fwrite(szPlainBlock, sizeof(char), iret, pfPlain);
	}
	printf("RSA_Decrypt OK!\n");

	fclose(pfPlain);
	fclose(pfCipher);
	free(szPlainBlock);
	free(szCipherBlock);
	RSA_free(pRsa);
	return SUCCESS;
}

RSA* RSA_read_privatekey(char *pszSource_file) {
	FILE *pfkey;
	RSA *pRsa;

	if ((pfkey = fopen(pszSource_file, "rb")) == NULL)
	{
		printf("\nopen file [ %s ] error!\n\n", pszSource_file);
		exit(0);
	}

	pRsa = RSA_new();
	pRsa = PEM_read_RSAPrivateKey(pfkey, NULL, NULL, NULL);

	return pRsa;
}

RSA* RSA_read_publickey(char *pszSource_file) {
	FILE *pfkey;
	RSA *pRsa;

	if ((pfkey = fopen(pszSource_file, "rb")) == NULL)
	{
		printf("\nopen file [ %s ] error!\n\n", pszSource_file);
		exit(0);
	}

	pRsa = RSA_new();
	pRsa = PEM_read_RSAPublicKey(pfkey, NULL, NULL, NULL);

	return pRsa;
}

int main(int argc, char *argv[]) {
	char szflag[5];
	char szSource_file[32];
	char szObject_file[32];

	if (argc != 4) {
		printf(
				"\nUsage: makeDES <flag> <Source file> <Object file> <key>\n");
		printf("flag        -- 标识，为1时进行加密操作，为2时进行解密操作\n");
		printf("Source file -- 源文件\n");
		printf("Object file -- 目标文件\n");
		return FAIL;
	}

	bzero(szflag, sizeof(szflag));
	bzero(szSource_file, sizeof(szSource_file));
	bzero(szObject_file, sizeof(szObject_file));

	strcpy(szflag, argv[1]);
	strcpy(szSource_file, argv[2]);
	strcpy(szObject_file, argv[3]);

	if (strcmp(szflag, "1") == 0) {
		printf("\n您选择的方式是[flag=%s],加密操作\n", szflag);
	} else {
		printf("\n您选择的方式是[flag=%s],解密操作\n", szflag);
	}
	printf("Source file: %s\n", szSource_file);
	printf("Object file: %s\n", szObject_file);

	if (strcmp(szflag, "1") == 0) {
		RSA_Encrypt(szSource_file, szObject_file);
	} else {
		RSA_Decrypt(szSource_file, szObject_file);
	}

	return SUCCESS;
}
