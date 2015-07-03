package main

import (
	"github.com/k0kubun/pp"
)

func String2Runes(strings []string) {
	var runes [][]rune
	for i, s := range strings {
		runes = append(runes, []rune{})
		for _, r := range s {
			runes[i] = append(runes[i], r)
		}
	}
	pp.Println(string(runes[1][1]))
	pp.Println(string(runes[0]))
	pp.Println(string(runes[2][2]))

}

func main() {
	s := []string{"阿居兎", "かきく", "さしす"}
	String2Runes(s)
}
