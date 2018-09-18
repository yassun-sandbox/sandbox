package main

import "fmt"

// メイン関数
func main() {
	m := map[string]int{"a": 100, "b": 200}

	// キーの存在を調べる
	v, ok := m["c"]

	fmt.Println(v)
	fmt.Println(ok)
}
