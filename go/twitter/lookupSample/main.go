package main

import (
	"fmt"
	"github.com/ChimeraCoder/anaconda"
	"github.com/joho/godotenv"
	"github.com/k0kubun/pp"
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
	v.Set("map", "true")

	ids := []int64{63112092456615930}

	tweets, err := api.GetTweetsLookupByIds(ids, v)
	pp.Println(tweets)
	if err != nil {
		panic(err)
	}

	for _, tweet := range tweets {
		fmt.Println(" ----------------- ")

		// tweet id
		pp.Println(tweet.IdStr)

		// tweet本文
		pp.Println(tweet.Text)

		// ハッシュタグ
		for _, hashtag := range tweet.Entities.Hashtags {
			pp.Println(hashtag.Text)
		}

		// リツイート数
		pp.Println(tweet.RetweetCount)

		// ふぁぼ
		pp.Println(tweet.FavoriteCount)

		// サムネ画像
		for _, media := range tweet.Entities.Media {

			// 画像
			pp.Println(media.Media_url)
			pp.Println(media.Type)
		}

		// ユーザー
		pp.Println(tweet.User.Name)
		pp.Println(tweet.User.IdStr)
		pp.Println(tweet.User.ProfileImageURL)
		pp.Println(tweet.User.ScreenName)

	}

}
