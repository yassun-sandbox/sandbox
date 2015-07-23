package main

import "fmt"

type Hoge struct {
	a int
	b float32
	c string
}

func (hoge *Hoge) String() string {
	return fmt.Sprintf("default %d/%g/%q", hoge.a, hoge.b, hoge.c)
}

func main() {
	hoge := &Hoge{10, -20, "hugahuga"}
	fmt.Printf("%v\n", hoge)
}
