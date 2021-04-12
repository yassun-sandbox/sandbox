use std::thread;

fn main(){
    let mut handles = Vec::new();
    for x in 0..10 {
        handles.push(thread::spawn(move||{
            println!("{}", x)
        }));
    }

    for handle in handles {
        let _ = handle.join();
    }
}

