package main

import (
	"fmt"
	"reflect"
)

// メイン関数
func main() {
	a := [5]int{2, 10, 8, 15, 4}
	b := a[2:4] //

	fmt.Println(reflect.TypeOf(a))
	fmt.Println(reflect.TypeOf(b))
	fmt.Println(len(b))
}
