package main

import (
	"encoding/xml"
	"fmt"
	"io/ioutil"
	"net/http"
)

type Atom1 struct {
	Title     string  `xml:"title"`
	Subtitle  string  `xml:"subtitle"`
	Id        string  `xml:"id"`
	Updated   string  `xml:"updated"`
	Rights    string  `xml:"rights"`
	Link      Link    `xml:"link"`
	Author    Author  `xml:"author"`
	EntryList []Entry `xml:"entry"`
}

type Link struct {
	Href string `xml:"href,attr"`
}

type Author struct {
	Name  string `xml:"name"`
	Email string `xml:"email"`
}

type Entry struct {
	Title   string `xml:"title"`
	Summary string `xml:"summary"`
	Content string `xml:"content"`
	Id      string `xml:"id"`
	Updated string `xml:"updated"`
	Link    Link   `xml:"link"`
	Author  Author `xml:"author"`
}

func main() {

	resp, err := http.Get("http://b.hatena.ne.jp/naoya/atomfeed")
	if err != nil {
		fmt.Println(err)
		return
	}
	defer resp.Body.Close()

	xmlContent, _ := ioutil.ReadAll(resp.Body)

	a := Atom1{}
	xml.Unmarshal(xmlContent, &a)

	for _, entry := range a.EntryList {
		fmt.Println(" -------------------------------- ")
		fmt.Println(entry.Title)
		fmt.Println(entry.Link.Href)
	}

}
