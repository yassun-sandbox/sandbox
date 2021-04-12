use std::thread;

fn main(){
    let handle = thread::spawn(||{
        println!("Hello");
    });

    dbg!(handle.join());
}
