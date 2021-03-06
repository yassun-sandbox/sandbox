use anyhow::{bail, ensure, Context, Result};
use clap::Clap;
use std::fs::File;
use std::io::{stdin, BufRead, BufReader};
use std::path::PathBuf;

struct RpnCalculator(bool);

impl RpnCalculator {
    pub fn new(verbose: bool) -> Self {
        Self(verbose)
    }

    pub fn eval(&self, formula: &str) -> Result<i32> {
        let mut tokens = formula.split_whitespace().rev().collect::<Vec<_>>();
        self.eval_inner(&mut tokens)
    }

    pub fn eval_inner(&self, tokens: &mut Vec<&str>) -> Result<i32> {
        let mut stack = Vec::new();
        let mut pos = 0;

        while let Some(token) = tokens.pop() {
            // 数値の場合
            if let Ok(x) = token.parse::<i32>() {
                stack.push(x);
            // 演算子の場合
            } else {
                // かならず2つとれる。
                let y = stack.pop().context(format!("invalid syntax at {}", pos))?;
                let x = stack.pop().context(format!("invalid syntax at {}", pos))?;

                let res = match token {
                    "+" => x + y,
                    "-" => x - y,
                    "*" => x * y,
                    "/" => x / y,
                    "%" => x % y,
                    _ => bail!("invalid token at {}", pos),
                };
                // 戻す
                stack.push(res);
            }

            // 無名フィールドの参照
            // RpnCalculator(bool)のbool
            if self.0 {
                println!("{:?} {:?}", tokens, stack);
            }
        }

        // 演算結果
        ensure!(stack.len() == 1, "invalid syntax");

        Ok(stack[0])
    }
}

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
    formula_file: Option<PathBuf>,
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
    let calc = RpnCalculator::new(verbose);

    // 一行づつ読み込み
    for line in reader.lines() {
        let line = line.unwrap();
        let answer = calc.eval(&line);
        println!("{}", answer);
    }
}

#[cfg(test)]
mod tests {
    // テストの親クラス
    use super::*;

    #[test]
    fn test_ok() {
        let calc = RpnCalculator::new(false);
        assert_eq!(calc.eval("5"), 5);
        assert_eq!(calc.eval("50"), 50);
        assert_eq!(calc.eval("-50"), -50);

        assert_eq!(calc.eval("2 3 +"), 5);
        assert_eq!(calc.eval("2 3 *"), 6);
        assert_eq!(calc.eval("2 3 -"), -1);
        assert_eq!(calc.eval("2 3 /"), 0);
        assert_eq!(calc.eval("2 3 %"), 2);
    }

    #[test]
    #[should_panic]
    fn test_ng() {
        let calc = RpnCalculator::new(false);
        calc.eval("1 1 ^");
    }
}
