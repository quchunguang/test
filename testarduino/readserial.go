package main

import (
	"bufio"
	"fmt"
	"github.com/tarm/goserial"
	// "time"
)

func main() {
	c := &serial.Config{Name: "/dev/ttyUSB0", Baud: 115200}
	s, err := serial.OpenPort(c)
	if err != nil {
		fmt.Println(err)
	}

	// _, err = s.Write([]byte("\x16\x02N0C0 G A\x03\x0d\x0a"))
	// if err != nil {
	// 	fmt.Println(err)
	// }
	// time.Sleep(time.Second / 2)

	reader := bufio.NewReader(s)
	for i := 1; i < 1000; i++ {
		reply, err := reader.ReadBytes('\x0a')
		if err != nil {
			panic(err)
		}
		fmt.Print(string(reply))
	}

	s.Close()
}
