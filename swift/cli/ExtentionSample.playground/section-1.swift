// Playground - noun: a place where people can play

import Foundation

// intを拡張
extension Int {
    func isEven() -> Bool {
        return self % 2 == 0
    }
}

var num = 6
println(num.isEven())
println(10.isEven())
