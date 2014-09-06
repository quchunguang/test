package main

/*
#include <stdio.h>

static void myPrint(const char* msg) {
	printf("myPrint: %s", msg);
}
*/
import "C"

func main() {
	//C.puts(C.CString("Hello, 世界\n"))
	//C.printf(C.CString("Hello, 世界\n")) // error
	C.myPrint(C.CString("Hello, 世界\n"))
}
