package main

import (
	"encoding/json"
	"fmt"
	//	"github.com/k0kubun/pp"
	"io/ioutil"
)

type Config struct {
	Settings []Setting `json:"settings"`
}

type Setting struct {
	Hoge string `json:"hoge"`
	Huga string `json:"huga"`
	Hega string `json:"hega"`
}

func main() {
	file, err := ioutil.ReadFile("./config.json")
	if err != nil {
		panic(err)
	}
	var config Config
	json.Unmarshal(file, &config)

	for _, setting := range config.Settings {
		fmt.Println(setting.Hoge)
		fmt.Println(setting.Huga)
		fmt.Println(setting.Hega)
	}

}
