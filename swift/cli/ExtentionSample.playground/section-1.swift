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

extension Double {
    var celiValue: Int{
        return Int(ceil(self))
    }
}

var doubleNum = 3.95
var intNum = doubleNum.celiValue
println(intNum)

