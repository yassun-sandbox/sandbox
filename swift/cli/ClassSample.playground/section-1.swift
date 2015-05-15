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
        self.init(neck: 1, size: "M")
    }
    
}