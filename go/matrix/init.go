package main

import (
	"github.com/k0kubun/pp"
)

func main() {
	runes := make([][]rune, 4)
	for i := range runes {
		runes[i] = make([]rune, 3)
	}

	pp.Print(runes)
}
