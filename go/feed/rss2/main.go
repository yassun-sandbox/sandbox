package main

import (
	"encoding/xml"
	"fmt"
	//	"github.com/k0kubun/pp"
	"html/template"
	"io/ioutil"
	"net/http"
)

type Rss2 struct {
	Title       string `xml:"channel>title"`
	Link        string `xml:"channel>link"`
	Description string `xml:"channel>description"`
	ItemList    []Item `xml:"item"`
}

type Item struct {
	// Required
	Title       string        `xml:"title"`
	Link        string        `xml:"link"`
	Description template.HTML `xml:"description"`

	// Optional
	Content  template.HTML `xml:"encoded"`
	PubDate  string        `xml:"pubDate"`
	Comments string        `xml:"comments"`
}

func main() {

	resp, err := http.Get("http://feeds.feedburner.com/hatena/b/hotentry")
	if err != nil {
		fmt.Println(err)
		return
	}
	defer resp.Body.Close()

	xmlContent, _ := ioutil.ReadAll(resp.Body)
	a := Rss2{}
	xml.Unmarshal(xmlContent, &a)

	for _, item := range a.ItemList {
		fmt.Println(" -------------------------------- ")
		fmt.Println(item.Title)
		fmt.Println(item.Link)
	}

}
