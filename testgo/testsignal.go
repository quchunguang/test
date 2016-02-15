package main

import (
	"fmt"
	"os"
	"os/signal"
	"syscall"
)

func main() {
	//Go 通过向一个通道发送 os.Signal 值来进行信号通知。我们将创建一个通道来接收这些通知（同时还创建一个用于在程序可以结束时进行通知的通道）。
	sigs := make(chan os.Signal, 1)
	done := make(chan bool, 1)
	//signal.Notify 注册这个给定的通道用于接收特定信号。
	signal.Notify(sigs, syscall.SIGINT, syscall.SIGTERM)
	//这个 Go 协程执行一个阻塞的信号接收操作。当它得到一个值时，它将打印这个值，然后通知程序可以退出。
	go func() {
		sig := <-sigs
		fmt.Println()
		fmt.Println(sig)
		done <- true
	}()
	//程序将在这里进行等待，直到它得到了期望的信号（也就是上面的 Go 协程发送的 done 值）然后退出。
	fmt.Println("awaiting signal")
	<-done
	fmt.Println("exiting")
}
