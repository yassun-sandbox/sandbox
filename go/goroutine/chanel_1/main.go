package main

import (
	"fmt"
	"time"
)

func main() {
	c := make(chan int)
	go func() {
		fmt.Println("ゴルーチン1")
		time.Sleep(1000 * time.Millisecond)
		c <- 1
	}()
	fmt.Println("ゴルーチン2")
	fmt.Println(<-c)
}
