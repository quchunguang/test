/*
  Copyright (c) 2011, Ciho Software Technology CO.,Ltd
  All rights reserved.
  
  File£ºsample_26_hw.c
    
*/

#include <string.h>
#include "ses_v3.h"
#include "..\inc\sample_26.h"
#include "key.h"

#define _DEBUG

/* global variable defination. */
unsigned char last_ses_error = 0; /* last SES error */
IO_PACKAGE out_pkg;  /* output package */
IO_PACKAGE *output = &out_pkg; 
IO_PACKAGE *input = (IO_PACKAGE *)pbInBuff; /* input package */
unsigned char tmp_buf[MAX_IO_DATA_SIZE];

/*
	Exit upon an error.
  
	Parameters:
		errcode[in]: error code
		msg[in]: additional error message
		msglen[in]: message length
  
	Return:
		none.

	Remarks:
		none.
*/
void error_exit(unsigned char errcode, unsigned char *msg, int msglen)
{
	output->tag = errcode;
	output->len = 0;
	
	/* for debug purpose only */
#ifdef  _DEBUG
	if (msglen != 0 && msg != NULL)
	{
		memcpy(output->buff, msg, msglen);
		output->len = msglen;
	}
#endif

	_set_response(2+output->len, (unsigned char *)output);
	_exit();
}
/*
	This function do DES/TDES en/decryption in ECB mode .
	
	Parameters:
		cmd[in]: command 
		key[in]: secret key
		in[in]:  input data
		inlen[in]: input data length
		out[out]: output data
		outlen[in,out]: [in]out buffer size &&[out]output length 
	Return: 
		If the function succeeds, it will return ERR_SUCCESS, otherwise 
		it returns corresponding error code.

	Remarks:
		External buffer required, defined as tmp_buf
*/

int enc_dec_ecb(unsigned char cmd, unsigned char *key, unsigned char *in,  unsigned char inlen, 
                                   unsigned char *out, unsigned char *outlen)
{
	unsigned char ret = 0;
	unsigned char length = 0;
	if ((inlen > 248)||(inlen < 1))
	{
		return ERR_INVALID_PARAMETER;
	} 
	length = ((inlen+7)>>3)<<3;
	if (*outlen < length) /* insufficient buffer size */
	{
		return ERR_INVALID_PARAMETER;
	} 
	ret = _mem_copy(tmp_buf, in, inlen);
	if (ret != SES_SUCCESS)
	{
		last_ses_error = ret;
		return ERR_SES;
	}
	switch(cmd)
	{
		case DES_ENC_ECB:
			ret = _des_enc(key, inlen, tmp_buf);			
		break;
		case DES_DEC_ECB:
			ret = _des_dec(key, inlen, tmp_buf);						
		break;
		case TDES_ENC_ECB:
			ret = _tdes_enc(key, inlen, tmp_buf);			
		break;
		case TDES_DEC_ECB:
			ret = _tdes_dec(key, inlen, tmp_buf);			
		break;		
		default:
			return ERR_INVALID_PARAMETER;
	}
	if (ret != SES_SUCCESS)
	{
		last_ses_error = ret;
		return ERR_SES;
	}
	ret = _mem_copy(out, tmp_buf, length);
	if (ret != SES_SUCCESS)
	{
		last_ses_error = ret;
		return ERR_SES;
	}
	*outlen = length;
	return ERR_SUCCESS;
}

/*
	This function do DES/TDES en/decryption in CBC mode .
	
	Parameters:
		cmd[in]: command 
		key[in]: secret key
		iv[in]:  initial vector
		in[in]:  input data
		inlen[in]: input data length
		out[out]: output data
		outlen[in,out]: [in]out buffer size &&[out]output length 
	Return: 
		If the function succeeds, it will return ERR_SUCCESS, otherwise 
		it returns corresponding error code.

	Remarks:
		External buffer required, defined as tmp_buf
*/
int enc_dec_cbc(unsigned char cmd, unsigned char *key, unsigned char *iv, unsigned char *in,  unsigned char inlen, 
                                  unsigned char *out, unsigned char *outlen)
{
	unsigned char ret = 0;
	unsigned char length = 0;
	unsigned char tmp_iv[8];
	unsigned char inputBlock[8];
  	unsigned int i = 0;
  	unsigned int j = 0;

	length = ((inlen+7)>>3)<<3;
	if (*outlen < length) /* insufficient buffer size */
	{
		return ERR_INVALID_PARAMETER;
	} 
	ret = _mem_copy(tmp_buf, in, inlen);
	if (ret != SES_SUCCESS)
	{
		last_ses_error = ret;
		return ERR_SES;
	}
	ret = _mem_copy(tmp_iv, iv, sizeof(tmp_iv));
	if (ret != SES_SUCCESS)
	{
		last_ses_error = ret;
		return ERR_SES;
	}
	
	if (inlen % 8)
	{
		//tmp_buf[inlen] = 0x80;
		tmp_buf[inlen] = 0x00;
		if (inlen % 8 > 1)
		{
			ret = _mem_set((tmp_buf + inlen + 1), 0x00, inlen%8-1);
			if (ret != SES_SUCCESS)
			{
				last_ses_error = ret;
				return ERR_SES;
			}
		}
	}
	for (i = 0; i < length/8; i++) 
	{
	    /* Chain if encrypting.
	     */
	    if (cmd == DES_ENC_CBC || cmd == TDES_ENC_CBC)
		{
			for (j = 0; j < 8; j++)
			{
				tmp_buf[i*8+j] ^= tmp_iv[j]; 
			}
			if (cmd == DES_ENC_CBC)
			{
				ret = _des_enc(key, 8, &tmp_buf[i*8]);
			}
			else
			{
				ret = _tdes_enc(key, 8, &tmp_buf[i*8]);
			}
			ret = _mem_copy(tmp_iv, &tmp_buf[i*8], 8);
	
		}
		else
		{
			ret = _mem_copy(inputBlock, &tmp_buf[i*8], 8);
			if (cmd == DES_DEC_CBC)
			{
				ret = _des_dec(key, 8, &tmp_buf[i*8]);
			}
			else
			{
				ret = _tdes_dec(key, 8, &tmp_buf[i*8]);
			}
			for (j = 0; j < 8; j++)
			{
				tmp_buf[i*8+j] ^= tmp_iv[j]; 
			}
			ret = _mem_copy(tmp_iv, inputBlock, 8);
		}
	
	}  

	if (ret != SES_SUCCESS)
	{
		last_ses_error = ret;
		return ERR_SES;
	}
	ret = _mem_copy(out, tmp_buf, length);
	if (ret != SES_SUCCESS)
	{
		last_ses_error = ret;
		return ERR_SES;
	}
	/* Zeroize sensitive information.
	*/
	ret = _mem_set (tmp_buf, 0, sizeof (tmp_buf));
	if (ret != SES_SUCCESS)
	{
		last_ses_error = ret;
		return ERR_SES;
	}

	*outlen = length;
	return ERR_SUCCESS;
}

void main()
{
	int ret = 0;
	unsigned char length = 0;
	// use "idata" to avoid key stored in "share memory" being revealed by other EXF
	//unsigned char idata key[16] = {0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x09,0x0A,0x0B,0x0C,0x0D,0x0E,0x0F};
	unsigned char idata key[16] = UKEY_ID;
	DATA_BLOCK *dblk = NULL;
	switch(input->tag)
	{
		case DES_ENC_ECB:
		case DES_DEC_ECB:
		case TDES_ENC_ECB:
		case TDES_DEC_ECB:
			length = sizeof(tmp_buf);
	   		ret = enc_dec_ecb(input->tag, key, input->buff, input->len, &output->buff, &length);
		break;
		case DES_ENC_CBC:
		case DES_DEC_CBC:
		case TDES_ENC_CBC:
		case TDES_DEC_CBC:
			dblk = (DATA_BLOCK *)input->buff;
			length = sizeof(tmp_buf);			
			ret = enc_dec_cbc(input->tag, key, dblk->iv, dblk->buff, dblk->len, &output->buff, &length);
		break;
		default:
			error_exit(ERR_INVALID_PARAMETER, NULL, 0);
	}
	if (ret != ERR_SUCCESS)
	{
		if (ret == ERR_SES)
		{
			error_exit(ret , &last_ses_error, 1);
		}
		else
		{
			error_exit(ret, NULL, 0);
		}
	}
	output->tag = ERR_SUCCESS;
	output->len = length;
	_set_response(IO_PACKAGE_HEADER_SIZE+output->len, (unsigned char *)output);
	_exit();  
}
