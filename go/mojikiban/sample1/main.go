package main

import "fmt"

func main() {
	getGraphicChar("字")
}

func getGraphicChar(c string) {
	nihongoRune := []rune(c)
	//	hex := hex.EncodeToString([]byte(c))
	hex := fmt.Sprintf("0x%x", nihongoRune[0])
	fmt.Println(hex)

}
