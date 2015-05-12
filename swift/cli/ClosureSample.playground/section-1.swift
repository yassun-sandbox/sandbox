// Playground - noun: a place where people can play

import Cocoa

func makeCounter() -> () -> Int {
    var value = 1
    
    func counter() -> Int {
        return ++value
    }
    
    return counter
}

var counter1 = makeCounter()
var counter2 = makeCounter()
counter1()
counter1()
counter1()

counter2()
counter2()
counter2()
