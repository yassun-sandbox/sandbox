package main

import (
	"fmt"
	"sort"
)

type Hoge []int

func (s Hoge) Len() int {
	return len(s)
}
func (s Hoge) Less(i, j int) bool {
	return s[i] < s[j]
}
func (s Hoge) Swap(i, j int) {
	s[i], s[j] = s[j], s[i]
}

func (s Hoge) String() string {
	sort.Sort(s)
	str := "["
	for i, elem := range s {
		if i > 0 {
			str += " "
		}
		str += fmt.Sprint(elem)
	}
	return str + "]"
}

func main() {
	hoge := &Hoge{4, 5, 2, 6, 1, 2, 3}
	fmt.Println(hoge)
}
