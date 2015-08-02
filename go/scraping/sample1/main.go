package main

import (
	"fmt"
	"github.com/PuerkitoBio/goquery"
	//"github.com/k0kubun/pp"
)

func GetPage(url string) {
	doc, _ := goquery.NewDocument(url)
	doc.Find("#main div.article-outer.hentry div.article-body.entry-content div.article-body-inner img").Each(func(_ int, s *goquery.Selection) {
		url, _ := s.Attr("src")
		fmt.Println(url)
	})
}

func main() {
	url := ""
	GetPage(url)
}
