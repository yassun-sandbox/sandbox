use std::sync::mpsc;
use std::thread;

fn main(){
    let mut handles = Vec::new();
    let mut data = vec![1;10];
    let mut send_channels = Vec::new();
    let mut rcv_channels = Vec::new();

    for _ in 0..10 {
        // main ->
        let (send_tx, send_rx) = mpsc::channel();

        // main <-
        let (rcv_tx, rcv_rx) = mpsc::channel();

        send_channels.push(send_tx);
        rcv_channels.push(rcv_rx);

        handles.push(thread::spawn(move||{
            let mut data = send_rx.recv().unwrap();
            data += 1;
            let _ = rcv_tx.send(data);
        }))
    }

    for x in 0..10 {
        let _ = send_channels[x].send(data[x]);
    }

    for x in 0..10 {
        data[x] = rcv_channels[x].recv().unwrap();
    }

    for handle in handles {
        let _ = handle.join();
    }

    dbg!(data);
}
