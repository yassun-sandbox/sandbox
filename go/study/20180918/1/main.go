package main

import "fmt"

func getMessage(name string) string {
	msg := "hi! my name is " + name
	return msg
}

func getHelloMessage(name string) (msg1 string, msg2 string) {
	msg1 = "Hello1 " + name
	msg2 = "Hello2 " + name
	return
}

// メイン関数
func main() {
	fmt.Println(getMessage("Yasu"))
	fmt.Println(getHelloMessage("Yasu"))
}
