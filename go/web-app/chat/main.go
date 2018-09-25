package main

import (
	"html/template"
	"log"
	"net/http"
	"path/filepath"
	"sync"
)

// テンプレートハンドラ
type templateHandler struct {
	once     sync.Once
	filename string
	templ    *template.Template
}

func (t *templateHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	// 1回しか呼び出さない、つまり1回しかコンパイルしない
	t.once.Do(func() {
		t.templ = template.Must(template.ParseFiles(filepath.Join("templates", t.filename)))
	})

	// responseに出力
	t.templ.Execute(w, nil)
}

func main() {
	r := newRoom()
	http.Handle("/", &templateHandler{filename: "chat.html"})
	http.Handle("/room", r)

	// チャットルームを開始します
	go r.run()

	// Webサーバーを起動します
	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatal("ListenAndServe:", err)
	}
}
