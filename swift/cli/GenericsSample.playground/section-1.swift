// Playground - noun: a place where people can play

import Cocoa

func showParam<T>(item: T) -> String {
    return "引数：\(item)"
}
showParam(1)
showParam("hoge")

// 型の制約とプロトコルの設定
func largerValue<T: Comparable>(a: T, b: T) -> T {
    return a > b ? a : b
}
largerValue(100,200)

// クラス定義
class Product<T> {
    var serialNumber:T
    var name:String
    init(serialNumber:T, name:String){
        self.serialNumber = serialNumber
        self.name = name
    }
}

var p1 = Product<String>(serialNumber: "A001", name: "hoge")
var p2 = Product<String>(serialNumber: "A002", name: "huga")

var p3 = Product<Int>(serialNumber: 100, name: "p3")
var p4 = Product<Int>(serialNumber: 200, name: "p4")
