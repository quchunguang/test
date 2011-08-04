extern "C" _declspec(dllexport) unsigned long TestEIV(unsigned char * buff);
extern "C" _declspec(dllexport) int crypto(int type, /* 0=encryptpgraphy, 1=decryptography */
		  unsigned char fromText[],
		  unsigned char toText[]
		  );
extern "C" _declspec(dllexport) int crypto2(int type, /* 0=encryptpgraphy, 1=decryptography */
		  unsigned char fromText[],
		  unsigned char toText[]
		  );
