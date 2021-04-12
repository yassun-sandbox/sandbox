struct Droppable;

impl Drop for Droppable {
    fn drop(&mut self){
        println!("resouce will be released");
    }
}

fn main(){
    {
       let _d = Droppable;
    }
    println!("end")
}
