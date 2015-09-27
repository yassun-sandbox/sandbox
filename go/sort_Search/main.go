package main

import (
	"fmt"
	"sort"
)

type myInt64Slice []int64

func (p myInt64Slice) Len() int           { return len(p) }
func (p myInt64Slice) Less(i, j int) bool { return p[i] < p[j] }
func (p myInt64Slice) Swap(i, j int)      { p[i], p[j] = p[j], p[i] }
func myInt64s(a []int64)                  { sort.Sort(myInt64Slice(a)) }

func main() {

	var x int64 = 11
	data := []int64{1, 60, 25, 6, 14, 20}
	myInt64s(data)

	i := sort.Search(len(data), func(i int) bool { return data[i] >= x })
	if i < len(data) && data[i] == x {
		fmt.Println("hogeは存在する")
	} else {
		fmt.Println("hogeは存在しない")
	}

}
