package main

import (
	"fmt"
	"time"
)

func Announce(message string, delay time.Duration) {
	go func() {
		time.Sleep(delay)
		fmt.Println(message)
	}()
}

func main() {
	Announce("ほげほげ", 1)
	fmt.Println("ふがふが")
	time.Sleep(100 * time.Second)
}
