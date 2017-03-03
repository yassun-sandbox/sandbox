package main

import (
	"fmt"
	"log"
)

func main() {
	fmt.Println("main start")
	defer fmt.Println("call defer")
	hoge()
	fmt.Println("main end")
}

func hoge() {
	log.Fatal("Error")
}
