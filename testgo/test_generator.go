package main

import (
	"fmt"
)

func fib(n int) chan int {
	c := make(chan int)
	go func() {
		a, b := 0, 1
		for i := 1; i < n; i++ {
			a, b = b, a+b
			c <- a
		}
		close(c)
	}()
	return c
}

func prime(n int) bool {
	for i := 2; i < n; i++ {
		if n%i == 0 {
			return false
		}
	}
	return true
}

// primes returns a channel of ints on witch the first n prime numbers before
//  close it.
func primes(n int) chan int {
	c := make(chan int)

	go func() {
		for i := 2; n > 0; i++ {
			if prime(i) {
				n--
				c <- i
			}
		}
		close(c)
	}()
	return c
}

func filterPrimes(cin chan int) chan int {
	cout := make(chan int)
	go func() {
		for i := range cin {
			if prime(i) {
				cout <- i
			}
		}
		close(cout)
	}()
	return cout
}

type Name struct {
	First  string
	Middle string
	Last   string
}

func (n Name) String() string {
	return fmt.Sprintf("%s %c. %s", n.First, n.Middle[0], n.Last)
}

func main() {
	name := Name{"William", "Mike", "Smith"}
	fmt.Println(name)

	fmt.Println("...")
	for i := range primes(10) {
		fmt.Println(i)
	}
	fmt.Println("...")
	for i := range filterPrimes(fib(10)) {
		fmt.Println(i)
	}
}
