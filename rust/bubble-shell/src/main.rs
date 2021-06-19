use std::env;
use std::io::{stdin, stdout, Write};
use std::process::{Command};
use std::path::Path;

fn main(){
    loop {
        // use the `>` character as the prompt
        // need to explicitly flush this to ensure it prints before read_line
        print!("> ");
        stdout().flush().unwrap();

        let mut input = String::new();
        stdin().read_line(&mut input).unwrap();

        // everything after the first whitespace character
        //     is interpreted as args to the command
        let mut parts = input.trim().split_whitespace();
        let command = parts.next().unwrap();
        let args = parts;

        match command {
            "cd" => {
                // default to '/' as new directory if one was not provided
                let new_dir = args.peekable().peek().map_or("/", |x| *x);
                let root = Path::new(new_dir);
                // ディレクトリの移動
                if let Err(e) = env::set_current_dir(&root) {
                    eprintln!("{}", e);
                }
            },
            command => {
                let mut child = Command::new(command)
                    .args(args)
                    .spawn()
                    .unwrap();

                child.wait().unwrap();
            }
        }
    }
}
