/*
 * testrsa.h
 *
 *  Created on: 2011-10-12
 *      Author: qcg
 */

#ifndef TESTRSA_H_
#define TESTRSA_H_

#define RSA_PRIVATE_KEY_NAME "rsaprivate.key"
#define RSA_PUBLIC_KEY_NAME "rsapublic.key"

#define FAIL 		1
#define SUCCESS 	0

int generate_key();
int RSA_Encrypt(char *pszSource_file, char *pszObject_file);
int RSA_Decrypt(char *pszSource_file, char *pszObject_file);
RSA* RSA_read_privatekey(char *pszSource_file);
RSA* RSA_read_publickey(char *pszSource_file);

#endif /* TESTRSA_H_ */
