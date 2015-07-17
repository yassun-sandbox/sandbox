package main

import "fmt"

func main() {
	hoge := map[string]int{
		"A": 1,
		"B": 2,
		"C": 3,
	}

	if num, ok := hoge["A"]; ok {
		fmt.Println(num)
		fmt.Println(ok)
	}

	if num, ok := hoge["D"]; !ok {
		fmt.Println(num)
		fmt.Println(ok)
	}

}
