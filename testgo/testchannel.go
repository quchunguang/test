package main

import (
	"fmt"
	"time"
)

func main() {
	c := make(chan int)
	go funin(c)
	go funout(c)
	time.Sleep(time.Second)
}

func funin(c chan int) {
	for i := 0; i < 10; i++ {
		c <- i
	}
	close(c)
	fmt.Println("funin end.")
}
func funout(c chan int) {
	for i := range c {
		fmt.Println(i)
	}
	fmt.Println("funout end.")
}
