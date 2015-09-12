package main

import (
	"fmt"
	"github.com/ChimeraCoder/anaconda"
	"github.com/joho/godotenv"
	"net/url"
	"os"
)

func main() {
	err := godotenv.Load()
	if err != nil {
		panic(err)
	}

	anaconda.SetConsumerKey(os.Getenv("CONSUMER_KEY"))
	anaconda.SetConsumerSecret(os.Getenv("CONSUMER_SECRET"))
	api := anaconda.NewTwitterApi(os.Getenv("ACCESS_TOKEN"), os.Getenv("ACCESS_TOKEN_SECRET"))

	v := url.Values{}
	v.Set("screen_name", "_Yasuun_")

	tweets, err := api.GetUserTimeline(v)
	if err != nil {
		panic(err)
	}

	for _, tweet := range tweets {
		fmt.Println("tweet: ", tweet.Text)
	}

}
