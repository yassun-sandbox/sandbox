// Playground - noun: a place where people can play

import Cocoa

class TShirt {
    var neck: Int
    var size: String
    
    // 指定イニシャライザ
    init(neck:Int, size:String){
        self.neck = neck
        self.size = size
    }
    
    // コンビニエンス・イニシャライザA
    convenience init(neck:Int){
        self.init(neck: neck, size: "M")
    }
    
    // コンビニエンス・イニシャライザB
    convenience init(size:String){
        self.init(neck: 1, size: size)
    }
    
}

// イニシャライザの指定なし
class ColoredTShirt: TShirt {
    var color: String = "white"
}

let ct1 = ColoredTShirt(neck: 2, size: "L")
ct1.neck
ct1.size

let ct2 = ColoredTShirt(neck: 2)
ct2.neck
ct2.size

let ct3 = ColoredTShirt(size: "L")
ct3.neck
ct3.size
