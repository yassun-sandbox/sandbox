use futures::executor;

async fn async_add(left: i32, right: i32) -> i32 {
    left + right
}

async fn somthing_great_async_function() -> i32 {
    let ans = async_add(2,3).await;
    println!("{}", ans);
    ans
}

fn main(){
    executor::block_on(somthing_great_async_function());
}
