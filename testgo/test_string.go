package main

import (
	"log"
	"strings"
)

func main() {
	log.Print(strings.Split("a,b,c", ","))
	log.Printf("%q\n", strings.SplitN("a,b,c", ",", 2))
	log.Printf("[%q]", strings.Trim(" !!! Achtung! Achtung! !!! ", "! "))
	log.Println(strings.TrimSpace(" \t\n a lone gopher \n\t\r\n"))

	r := strings.NewReplacer("<", "&lt;", ">", "&gt;")
	log.Println(r.Replace("This is <b>HTML</b>!"))
}
