package main

import (
	"log"
	"net/http"

	"./trace"
	"github.com/gorilla/websocket"
	"github.com/stretchr/objx"
)

type room struct {
	// forwardは他のクライアントに転送するためのメッセージを保持するチャネルです。
	forward chan *message
	// joinはチャットルームに参加しようとしているクライアントのためのチャネルです。
	join chan *client
	// leaveはチャットルームから退室しようとしているクライアントのためのチャネルです。
	leave chan *client
	// clientsには在室しているすべてのクライアントが保持されます。
	clients map[*client]bool

	// tracerはチャットルーム上で行われた操作のログを受け取ります。
	tracer trace.Tracer

	// avatarはアバターの情報を取得します。
	avatar Avatar
}

func newRoom(avatar Avatar) *room {
	return &room{
		forward: make(chan *message),
		join:    make(chan *client),
		leave:   make(chan *client),
		clients: make(map[*client]bool),
		avatar:  avatar,
	}
}

func (r *room) run() {
	for {
		select {
		case client := <-r.join:
			// 参加
			r.clients[client] = true
			r.tracer.Trace("新しいクライアントが参加しました")

		case client := <-r.leave:
			// 退室
			delete(r.clients, client)
			// チャンネルのクローズ
			close(client.send)
			r.tracer.Trace("クライアントが退出しました")
		case msg := <-r.forward:
			r.tracer.Trace("メッセージを受信しました: ", msg.Message)
			// すべてのクライアントにメッセージを転送
			for client := range r.clients {
				select {
				case client.send <- msg:
					// メッセージを送信
					r.tracer.Trace("メッセージを受信しました: ", msg.Message)
				default:
					// 送信に失敗
					delete(r.clients, client)
					// チャンネルのクローズ
					close(client.send)
				}
			}
		}
	}
}

const (
	socketBufferSize  = 1024
	messageBufferSize = 256
)

var upgrader = &websocket.Upgrader{
	ReadBufferSize:  socketBufferSize,
	WriteBufferSize: socketBufferSize,
}

// HTTPハンドラ用のメソッド
// /roomにアクセスしたときの処理
func (r *room) ServeHTTP(w http.ResponseWriter, req *http.Request) {

	// Webソケットを使うための処理
	socket, err := upgrader.Upgrade(w, req, nil)
	if err != nil {
		log.Fatal("ServeHTTP:", err)
		return
	}

	// クッキーの取得
	authCookie, err := req.Cookie("auth")
	if err != nil {
		log.Fatal("クッキーの取得に失敗しました:", err)
		return
	}

	// client
	client := &client{
		socket:   socket,
		send:     make(chan *message, messageBufferSize),
		room:     r,
		userData: objx.MustFromBase64(authCookie.Value),
	}

	// チャットルームに入る(run側で拾われるイベント)
	r.join <- client

	// このスコープから抜けるなら退出する。
	defer func() { r.leave <- client }()

	// 別のスレッドで動作する。
	go client.write()

	// メインスレッドで無限ループ
	client.read()
}
