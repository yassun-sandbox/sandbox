fn get_int_from_file() -> Result<i32, String> {
    let path = "number.txt";

    // 失敗した時だけ中の値を加工する:map_err
    let num_str = std::fs::read_to_string(path).map_err(|e| e.to_string())?;

    // ?をつけると以下と一緒になる
    //let num_str_result = std::fs::read_to_string(path).map_err(|e| e.to_string());
    //let num_str = match num_str_result {
    //    Ok(t) => t,
    //    Err(e) => return Err(e),
    //};

    num_str
        .trim()
        .parse::<i32>()
        .map(|t| t * 2) // parseの結果がOkの場合
        .map_err(|e| e.to_string()) // parseの結果がNGの場合
}

fn main() {
    match get_int_from_file() {
        Ok(x) => println!("{}", x),
        Err(e) => println!("{}", e),
    }
}
