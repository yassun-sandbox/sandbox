// Playground - noun: a place where people can play

import Cocoa

// クラスタイプ・プロパティ
class myCalc {
    class var PI:Double {
        return 3.14
    }
    class var DoublePi: Double {
        return self.PI * 2
    }
}

// ストアド・プロパティ
struct Greeting {
    static var greeting = "こんにちは"
    static var niceToSeeYou: String {
        return "初めまして" + greeting
    }
}

Greeting.greeting
Greeting.niceToSeeYou

// willSet and didSet
class GamePoint {
    let Max = 100
    var point : Int = 0 {
        willSet {
            println("ポイントが\(newValue)に変更されます")
        }
        didSet {
            if point > Max {
                point = Max
                println("最大値を超えたので\(point)に補正しました")
            }
            
        }
    }
    
    init(point:Int){
        self.point = point
    }
}
var p1 = GamePoint(point: 90)
p1.point = 30
p1.point = 150
println("\(p1.point)")

