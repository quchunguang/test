/*
	A simple demo of cgo.
*/
package main

/*
#cgo CFLAGS: -I .
#cgo LDFLAGS: -L . -lfoo

#include <stdio.h>
#include <stdlib.h>
#include "foo.h"
*/
import "C"
import (
	// "fmt"
	// "syscall"
	"unsafe"
)

func DemoCgo() {
	// call functions from libc
	msg := C.CString("Hello, 世界")
	defer C.free(unsafe.Pointer(msg))
	C.puts(msg)

	// call function from libfoo
	var cmsg *C.char = C.CString("进入 print2()")
	defer C.free(unsafe.Pointer(cmsg))
	C.print2(cmsg)
}

func main() {
	DemoCgo()
}
