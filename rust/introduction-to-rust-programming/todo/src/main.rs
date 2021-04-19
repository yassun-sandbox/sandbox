use actix_web::{get, App, HttpResponse, HttpServer, ResponseError};
use thiserror::Error;
use askama::Template;

// Entity
struct TodoEntry{
    id: u32,
    text: String,
}

// テンプレートとのマッピング
#[derive(Template)]
#[template(path = "index.html")]
struct IndexTemplate{
    entries: Vec<TodoEntry>,
}

#[derive(Error,Debug)]
enum MyError{
    // askamaエラーもMyErrorに含める
    #[error("Faild to render HTML")]
    AskamaError(#[from] askama::Error)
}
impl ResponseError for MyError {}

#[get("/")]
async fn index() -> Result<HttpResponse, MyError> {
    let mut entries  = Vec::new();
    entries.push(TodoEntry{
        id: 1,
        text: "First".to_string() //Strは固定長なので変換が必要
    });
    entries.push(TodoEntry{
        id: 2,
        text: "Second".to_string()
    });

    // 変数をbind
    let html = IndexTemplate{entries};
    let response_body = html.render()?;
    Ok(
        HttpResponse::Ok()
        .content_type("text/html")
        .body(response_body)
    )
}

#[actix_rt::main]
async fn main() -> Result<(), actix_web::Error> {
    HttpServer::new(move || App::new().service(index))
        .bind("0.0.0.0:8080")?
        .run()
        .await?;
    Ok(())
}
