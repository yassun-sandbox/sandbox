package main

import (
//	"github.com/k0kubun/pp"
//	"fmt"
)

func String2Runes(strings []string) [][]rune {
	var runes [][]rune
	for i, s := range strings {
		runes = append(runes, []rune{})
		for _, r := range s {
			runes[i] = append(runes[i], r)
		}
	}

	return runes
}

func main() {
	s := []string{"あいう", "かきく", "さしす"}
	sRunes := String2Runes(s)
	rotate(sRunes)
}

func rotate(stringRune [][]rune) {
	runes := make([][]rune, 4)
	for i := range runes {
		runes[i] = make([]rune, 3)
	}

	for x, _ := range stringRune[0] {
		for y, _ := range stringRune {
			runes[x][y] = stringRune[y][x]
		}
	}

}
