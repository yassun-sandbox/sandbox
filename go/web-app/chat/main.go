package main

import (
	"flag"
	"html/template"
	"log"
	"net/http"
	"os"
	"path/filepath"
	"sync"

	"github.com/joho/godotenv"
	"github.com/stretchr/gomniauth"
	"github.com/stretchr/gomniauth/providers/facebook"
	"github.com/stretchr/gomniauth/providers/github"
	"github.com/stretchr/gomniauth/providers/google"

	"./trace"
)

func Env_load() {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}
}

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
	t.templ.Execute(w, r)
}

func main() {
	Env_load()

	var addr = flag.String("addr", ":8080", "アプリケーションのアドレス")
	flag.Parse() // フラグを解釈します

	// Gomniauthのセットアップ
	gomniauth.SetSecurityKey("12345")
	gomniauth.WithProviders(
		facebook.New("クライアントID", "秘密の値", "http://localhost:8080/auth/callback/facebook"),
		github.New("クライアントID", "秘密の値", "http://localhost:8080/auth/callback/github"),
		google.New(os.Getenv("CLIENT_ID"), os.Getenv("SECRET_KEY"), "http://localhost:8080/auth/callback/google"),
	)

	r := newRoom()
	r.tracer = trace.New(os.Stdout)
	http.Handle("/chat", MustAuth(&templateHandler{filename: "chat.html"}))
	http.Handle("/login", &templateHandler{filename: "login.html"})
	// 状態を持たない場合は関数を使うでもよい
	http.HandleFunc("/auth/", loginHandler)
	http.Handle("/room", r)

	// チャットルームを開始します
	go r.run()

	// Webサーバーを起動します
	log.Println("Webサーバーを開始します。ポート: ", *addr)
	if err := http.ListenAndServe(*addr, nil); err != nil {
		log.Fatal("ListenAndServe:", err)
	}

}
