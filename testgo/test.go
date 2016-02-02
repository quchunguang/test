package main

import (
	"fmt"
)

const (
	a        = iota
	b string = "0"
	c        = iota
	d
	e
)

func main() {
	fmt.Println("OK")
	fmt.Println("END")
	fmt.Println(a, b, c, d, e)
}
