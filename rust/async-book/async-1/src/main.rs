use async_std::task;

fn main() {
    let mut futures = vec![]; // ベクター初期化

    for i in 0..10 {
        // クロージャを定義
        let async_function = async move {
            println!("{}", i);
        };

        // いま定義したクロージャを実行する非同期タスクを生成 + スケジューリングしている
        let handle = task::spawn(async_function);

        // 非同期タスクのハンドラーを待機リストに入れる
        futures.push(handle);
    }

    task::block_on(async {
        for f in futures {
          // 各々の非同期タスクの完了を待つ
            f.await
        }
    });
}
