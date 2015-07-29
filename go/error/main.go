package main

import (
	"fmt"
	"os"
)

type Error interface {
	String() string
}

type PathError struct {
	Op    string
	Path  string
	Error Error
}

func (e *PathError) String() string {
	return e.Op + " " + e.Path + ": " + e.Error.String()
}

func main() {

}
