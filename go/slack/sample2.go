package main

import (
	"fmt"
	"log"
	"os"

	"github.com/joho/godotenv"
	"github.com/slack-go/slack"
)

func Env_load() {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}
}

func main() {
	Env_load()
	api := slack.New(os.Getenv("SAMPLE_TOKEN"), slack.OptionDebug(true))
	_, _, err := api.PostMessage("test", slack.MsgOptionText("Yes, hello.", false))
	if err != nil {
		fmt.Printf("%s\n", err)
		return
	}
}
