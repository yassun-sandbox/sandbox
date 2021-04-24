use std::io::{self, BufRead, BufReader, Write};
use std::net::TcpStream;
use std::str;

/**
 * 指定のIPアドレス、ポート番号にTCP接続する。
 */
pub fn connect(address: &str) -> Result<(), failure::Error> {

    // 指定されたソケットに繋ぎにいく
    let mut stream = TcpStream::connect(address)?;

    loop {
        // 標準入力から文字列を取得
        let mut input = String::new();
        io::stdin().read_line(&mut input)?;

        // ソケットに書き込む
        stream.write_all(input.as_bytes())?;

        // ソケットから受信したデータを取得
        let mut reader = BufReader::new(&stream);
        let mut buffer = Vec::new();
        reader.read_until(b'\n', &mut buffer)?;

        print!("{}", str::from_utf8(&buffer)?);
    }
}
