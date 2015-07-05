package main

import (
	"github.com/k0kubun/pp"
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
	runes := make([][]rune, 4)
	for i := range runes {
		runes[i] = make([]rune, 3)
	}

	s := []string{"あいう", "かきく", "さしす"}
	sRunes := String2Runes(s)

	for i := range sRunes {
		pp.Println(string(sRunes[i]))
	}

}
