use std::io::{Read, Write};
use std::net::{TcpListener, TcpStream};
use std::{str, thread};

/**
 * 指定のソケットアドレスで接続を待ち受ける
 */
pub fn serve(address: &str) -> Result<(), failure::Error> {
    // ソケットの作成
    let listener = TcpListener::bind(address)?;
    loop {

        // 3ハンドシェイクの完了した確立済のコネクションが作成されるまでスレッドを停止する
        let (stream, _) = listener.accept()?;

        // スレッドを立ち上げて接続に対処する。
        thread::spawn(move || {
            handler(stream).unwrap_or_else(|error| error!("{:?}", error));
        });
    }
}

/**
 * クライアントからの入力を待ち受け、受信したら同じものを返却する。
 */
fn handler(mut stream: TcpStream) -> Result<(), failure::Error> {
    debug!("Handling data from {}", stream.peer_addr()?);
    let mut buffer = [0u8; 1024];
    loop {
        let nbytes = stream.read(&mut buffer)?;
        // EOF
        if nbytes == 0 {
            debug!("Connection closed.");
            return Ok(());
        }
        // 標準出力に表示
        print!("{}", str::from_utf8(&buffer[..nbytes])?);

        // クライアントへ返却
        stream.write_all(&buffer[..nbytes])?;
    }
}
