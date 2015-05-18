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

