// Playground - noun: a place where people can play

import Cocoa

// 比較用関数
func myFun(num1: Int, num2: Int) -> Bool {
    return num1 > num2
}

var numbers = [9,10,55,20,1]

numbers.sort(myFun)

// クロージャで代用
numbers.sort({$0 > $1})

