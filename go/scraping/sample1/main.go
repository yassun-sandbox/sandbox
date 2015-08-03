package main

import (
	"crypto/md5"
	"fmt"
	"github.com/PuerkitoBio/goquery"
	"io"
	"net/http"
	"os"
	"strconv"
	"sync"
	"time"
)

func GetPage(url string) {
	fmt.Println(url)

	i := 1
	filepath := fmt.Sprintf("%x", md5.Sum([]byte(url)))

	doc, _ := goquery.NewDocument(url)
	doc.Find("#main div.article-outer.hentry div.article-body.entry-content div.article-body-inner img").Each(func(_ int, s *goquery.Selection) {
		url, _ := s.Attr("src")
		fmt.Println(url)
		dl(url, filepath, strconv.Itoa(i))
		i = i + 1
	})
}

func GoGet(urls []string) {
	var wg sync.WaitGroup
	for _, url := range urls {
		time.Sleep(100 * time.Millisecond)
		wg.Add(1)
		go func(url string) {
			defer wg.Done()
			GetPage(url)
		}(url)
	}
	wg.Wait()
}

func main() {
	urls := []string{}
	GoGet(urls)
}

func dl(url string, filepath string, filename string) {
	response, _ := http.Get(url)
	defer response.Body.Close()

	os.Mkdir(filepath, 0777)

	file, _ := os.OpenFile("./"+filepath+"/"+filename+".jpg", os.O_CREATE|os.O_WRONLY, 0666)
	defer file.Close()

	io.Copy(file, response.Body)
}
