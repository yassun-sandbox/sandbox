package main

import (
	"os"
)

func Contents(filename string) (string, os.Error) {
	f, err := os.Open(filename)
	if err != nil {
		return "", err
	}
	defer f.Close() // f.Closeは、完了時に実行される

	var result []byte
	buf := make([]byte, 100)
	for {
		n, err := f.Read(buf[0:])
		result = append(result, buf[0:n]...)
		if err != nil {
			if err == os.EOF {
				break
			}
			return "", err // ここでリターンしたときに、fはクローズされる
		}
	}
	return string(result), nil // ここでリターンしたときに、fはクローズされる
}
