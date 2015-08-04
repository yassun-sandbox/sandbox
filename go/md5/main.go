package main

import (
	"crypto/md5"
	"fmt"
)

func main() {
	data := []byte("A")
	hoge := fmt.Sprintf("%x", md5.Sum(data))
	fmt.Println(hoge)
}
