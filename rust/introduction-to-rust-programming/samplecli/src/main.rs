use clap::Clap;
use std::fs::File;
use std::io::{stdin, BufRead, BufReader};

// アトリビュート
#[derive(Clap, Debug)]
#[clap(
    name = "My RPN program",
    version = "1.0.0",
    author = "Your name",
    about = "Super awesome sample RPN calculator"
)]
struct Opts {
    #[clap(short, long)]
    verbose: bool,

    #[clap(name = "FILE")]
    formula_file: Option<String>,
}

fn main() {
    let opts = Opts::parse();

    // ファイルの読込み
    if let Some(path) = opts.formula_file{
        let f = File::open(path).unwrap();
        let reader = BufReader::new(f);
        run(reader, opts.verbose);
    // 標準入力のケース
    } else {
        let stdin = stdin();
        let reader = stdin.lock();
        run(reader, opts.verbose);
    }
}

// トレイト境界: R = BufReadを実装している型
fn run<R: BufRead>(reader: R, verbose: bool){
    for line in reader.lines(){
        let line = line.unwrap();
        println!("{}", line);
    }
}
