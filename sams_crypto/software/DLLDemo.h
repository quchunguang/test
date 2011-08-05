extern "C" _declspec(dllexport) unsigned long TestEIV(unsigned char * buff);
extern "C" _declspec(dllexport) int crypto(
			int type, /* 0=encryptpgraphy, 1=decryptography */
			unsigned char fromText[],
			unsigned char toText[]
		  );
extern "C" _declspec(dllexport) int crypto2(
			int type, /* 0=encryptpgraphy, 1=decryptography */
			unsigned char fromText[],
			unsigned char toText[]
		  );
extern "C"  _declspec(dllexport) void encryptrand(
			unsigned char random[],		/* 16 byte chars like: dasf98723478fd7a */
			unsigned char encrypt_hex[]			/* 32 byte hex chars like: 00010203040506070809f0f1f2f3f4f5 */
		  );