// DLLDemo.cpp : Defines the entry point for the DLL application.
//

#include "sense4.h"
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include "common.h"
#include "..\inc\sample_26.h"
#include "DLLDemo.h"

/* global variables definition */
SENSE4_CONTEXT stS4Ctx = {0};
unsigned long dwBytesReturned = 0;

IO_PACKAGE stDataPkgIn = {0};
IO_PACKAGE stDataPkgOut = {0};

#define S4_EXE_FILE_1 "f001"
#define S4_EXE_FILE_2 "f002"

int enc_dec_ecb(int id, unsigned char cmd, unsigned char *in,  unsigned char inlen, 
				unsigned char *out, unsigned char *outlen)
{
	unsigned long dwResult = S4_SUCCESS;
	assert(NULL != out && NULL != outlen && NULL != in);
	assert(cmd == DES_ENC_ECB || cmd == DES_DEC_ECB || cmd == TDES_ENC_ECB || cmd == TDES_DEC_ECB);

	stDataPkgIn.tag = cmd;
	stDataPkgIn.len = inlen;
	memcpy(stDataPkgIn.buff, in, inlen);
	
	//printf("id=%d\n",id);
	if (id == 1) {
		dwResult = S4Execute(&stS4Ctx, S4_EXE_FILE_1, &stDataPkgIn, 
			IO_PACKAGE_HEADER_SIZE+stDataPkgIn.len,
			&stDataPkgOut, sizeof(IO_PACKAGE), &dwBytesReturned);
		//printf("%s\n",S4_EXE_FILE_1);
	} else if (id == 2){
		dwResult = S4Execute(&stS4Ctx, S4_EXE_FILE_2, &stDataPkgIn, 
			IO_PACKAGE_HEADER_SIZE+stDataPkgIn.len,
			&stDataPkgOut, sizeof(IO_PACKAGE), &dwBytesReturned);
		//printf("%s\n",S4_EXE_FILE_2);
	}
	if (dwResult != S4_SUCCESS)
	{
		return S4_ERROR_INVALID_DATA;
	}
	if (*outlen < stDataPkgOut.len)
	{
		return S4_ERROR_OUT_BUFFER; 		
	}
	*outlen = stDataPkgOut.len;
	memcpy(out,stDataPkgOut.buff,stDataPkgOut.len);	

	return S4_SUCCESS;
}

int enc_dec_cbc(unsigned char cmd, unsigned char *iv, unsigned char *in,  unsigned char inlen, 
				unsigned char *out, unsigned char *outlen)

{
	unsigned long dwResult = S4_SUCCESS;
	DATA_BLOCK stDataBlk = {0};

	assert(NULL != out && NULL != outlen && NULL != in && iv != NULL);
	assert(cmd == DES_ENC_CBC || cmd == DES_DEC_CBC || cmd == TDES_ENC_CBC || cmd == TDES_DEC_CBC);
	
	if (inlen > MAX_DATA_BLOCK_LEN)
	{
		return S4_ERROR_INPUT_TOO_LONG;
	}
	memcpy(stDataBlk.iv, iv, sizeof(stDataBlk.iv));
	stDataBlk.len = inlen;
	memcpy(stDataBlk.buff, in, inlen);
	stDataPkgIn.tag = cmd;
	stDataPkgIn.len = sizeof(stDataBlk) - sizeof(stDataBlk.buff) + stDataBlk.len;
	memcpy(stDataPkgIn.buff, &stDataBlk, stDataPkgIn.len);

	dwResult = S4Execute(&stS4Ctx, S4_EXE_FILE_1, &stDataPkgIn, 
		IO_PACKAGE_HEADER_SIZE+stDataPkgIn.len,
		&stDataPkgOut, sizeof(IO_PACKAGE), &dwBytesReturned);
	if (dwResult != S4_SUCCESS)
	{
		return dwResult;
	}
	if (*outlen < stDataPkgOut.len)
	{
		return S4_ERROR_INSUFFICIENT_BUFFER; 		
	}
	*outlen = stDataPkgOut.len;
	memcpy(out,stDataPkgOut.buff,stDataPkgOut.len);	
	
	return S4_SUCCESS;
}

extern "C"  _declspec(dllexport) unsigned long TestEIV(unsigned char * buff)
{
	SENSE4_CONTEXT ctx = {0};
	SENSE4_CONTEXT *pctx = NULL;
	unsigned long size = 0;
	unsigned long ret = 0;
	
	S4Enum(pctx, &size);
	if (size == 0)
	{

		//printf("EliteIV not found!\n");
		return 111;
	}
	
	pctx = (SENSE4_CONTEXT *)malloc(size);
	if (pctx == NULL)
	{
		//printf("Not enough memory!\n");
		return 222;
	}
	
	ret = S4Enum(pctx, &size);
	if (ret != S4_SUCCESS)
	{
		
		//printf("Enumerate EliteIV error!\n");
		free(pctx);
		return ret;
	}
	
	memcpy(&ctx, pctx, sizeof(SENSE4_CONTEXT));
	free(pctx);
	pctx = NULL;
	
	ret = S4Open(&ctx);
	if (ret != S4_SUCCESS)
	{
		//printf("Open EliteIV failed!\n");
		return ret;
	}
	
	ret = S4ChangeDir(&ctx, "\\");
	if (ret != S4_SUCCESS)
	{
		//printf("No root directory found!\n");
		S4Close(&ctx);
		return ret;
	}
	
	ret = S4VerifyPin(&ctx, (unsigned char *)"12345678", 8, S4_USER_PIN);
	if (ret != S4_SUCCESS)
	{
		//printf("Verify user PIN failed!\n");
		S4Close(&ctx);
		return ret;
	}
	
	ret = S4Execute(&ctx, "0001", buff, 10, buff, 10, &size);
	if (ret != S4_SUCCESS)
	{
		//printf("Execute EliteIV exe failed!\n");
		S4Close(&ctx);
		return ret;
	}
	
	S4Close(&ctx);
	
	return 0;
}
extern "C"  _declspec(dllexport) int crypto(
			int type, /* 0=encryptpgraphy, 1=decryptography */
			unsigned char fromText[],
			unsigned char toText[]
		  )
/*extern "C" __declspec(dllexport) int crypto(int type,
		  unsigned char fromText[],
		  unsigned char toText[]
		  )*/
{
	unsigned long dwResult = S4_SUCCESS;
	unsigned char lpUserPin[] = USERPEN;
	unsigned char TextLen = BUFFERLENGTH;
	unsigned char tmp;
	//printf("call crypto\n");
	if (!(dwResult = OpenS4ByIndex(FIRST_S4_INDEX,&stS4Ctx)))
	{
		return S4_ERROR_DEVICE;
	}   
	
	dwResult = S4ChangeDir(&stS4Ctx, "\\");
	if (dwResult != S4_SUCCESS) 
	{
		S4Close(&stS4Ctx);
		return dwResult;
	}
	
	// Call S4VerifyPin(...) to verify User PIN so as to get the privilege to execute the program in EliteIV.
	dwResult = S4VerifyPin(&stS4Ctx, lpUserPin, strlen((LPCSTR)lpUserPin), S4_USER_PIN);
	if (dwResult != S4_SUCCESS) 
	{
		S4Close(&stS4Ctx);
		return dwResult;
	}

	if(type == 0){
		if (dwResult = enc_dec_ecb(1, TDES_ENC_ECB, fromText, TextLen, toText, &tmp))
		{
			ResetAndCloseS4(&stS4Ctx);
			return dwResult;
		}
	}
	else {
		if (dwResult = enc_dec_ecb(1, TDES_DEC_ECB, fromText, TextLen, toText, &tmp))
		{
			ResetAndCloseS4(&stS4Ctx);
			return dwResult;
		}
	}

	/* for better security,use the following instead of using S4close() directly */
	ResetAndCloseS4(&stS4Ctx);

	return S4_SUCCESS;
}

extern "C"  _declspec(dllexport) int crypto2(
			int type, /* 0=encryptpgraphy, 1=decryptography */
			unsigned char fromText[],
			unsigned char toText[]
		  )
/*extern "C" __declspec(dllexport) int crypto(int type,
		  unsigned char fromText[],
		  unsigned char toText[]
		  )*/
{
	unsigned long dwResult = S4_SUCCESS;
	unsigned char lpUserPin[] = USERPEN;
	unsigned char TextLen = BUFFERLENGTH;
	unsigned char tmp;
	//printf("call crypto2\n");
	if (!(dwResult = OpenS4ByIndex(FIRST_S4_INDEX,&stS4Ctx)))
	{
		return S4_ERROR_DEVICE;
	}   
	
	dwResult = S4ChangeDir(&stS4Ctx, "\\");
	if (dwResult != S4_SUCCESS) 
	{
		S4Close(&stS4Ctx);
		return dwResult;
	}
	
	// Call S4VerifyPin(...) to verify User PIN so as to get the privilege to execute the program in EliteIV.
	dwResult = S4VerifyPin(&stS4Ctx, lpUserPin, strlen((LPCSTR)lpUserPin), S4_USER_PIN);
	if (dwResult != S4_SUCCESS) 
	{
		S4Close(&stS4Ctx);
		return dwResult;
	}

	if(type == 0){
		if (dwResult = enc_dec_ecb(2, TDES_ENC_ECB, fromText, TextLen, toText, &tmp))
		{
			ResetAndCloseS4(&stS4Ctx);
			return dwResult;
		}
	}
	else {
		if (dwResult = enc_dec_ecb(2, TDES_DEC_ECB, fromText, TextLen, toText, &tmp))
		{
			ResetAndCloseS4(&stS4Ctx);
			return dwResult;
		}
	}

	/* for better security,use the following instead of using S4close() directly */
	ResetAndCloseS4(&stS4Ctx);

	return S4_SUCCESS;
}

char char2hex(char c)
{
	if (c < 0x0A) {
		return c + 0x30;
	}
	else if (c >= 0x0A && c <= 0x0F) {
		return c + 0x41 - 0x0A;
	}
	else {
		return 'x';
	}
}

/* using crypto2() encrypt random pass from server */
extern "C"  _declspec(dllexport) void encryptrand(
			unsigned char random[],		/* 16 byte chars like: dasf98723478fd7a */
			unsigned char encrypt_hex[]		/* 32 byte hex chars like: 00010203040506070809f0f1f2f3f4f5 */
		  )
{
	int i;
	char a, b;
	unsigned char encrypt[200];
	memset(encrypt, 0, 200);
	crypto2(0, random, encrypt);
	for (i=0; i<16; i++){
		a = (encrypt[i] & 0xF0) >> 4;
		b = encrypt[i] & 0x0F;
		encrypt_hex[2 * i] = char2hex(a);
		encrypt_hex[2 * i + 1] = char2hex(b);
	}
}

BOOL APIENTRY DllMain( HANDLE hModule, 
                       DWORD  ul_reason_for_call, 
                       LPVOID lpReserved
					 )
{
    return TRUE;
}

