package main

import (
	"fmt"
	"github.com/PuerkitoBio/goquery"
	"io"
	"net/http"
	"os"
	"strconv"
)

func GetPage(url string) {
	i := 1
	doc, _ := goquery.NewDocument(url)
	doc.Find("#main div.article-outer.hentry div.article-body.entry-content div.article-body-inner img").Each(func(_ int, s *goquery.Selection) {
		url, _ := s.Attr("src")
		fmt.Println(url)
		dl(url, strconv.Itoa(i))
		i = i + 1
	})
}

func main() {
	url := ""
	GetPage(url)
}

func dl(url string, filename string) {
	response, _ := http.Get(url)
	defer response.Body.Close()

	file, _ := os.OpenFile("./"+filename+".jpg", os.O_CREATE|os.O_WRONLY, 0666)
	defer file.Close()

	io.Copy(file, response.Body)
}
