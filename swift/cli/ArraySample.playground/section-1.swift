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

// Filter Sample
let files = ["index.html","secret.txt","sample.html","main.swift"]
let htmlFiles = files.filter({$0.hasSuffix(".html")})

// Map Sample
let inchArray = [2.0, 3.5, 1.0, 5.3]
let cmArray   = inchArray.map{$0 * 2.54}

// reduce
var sum1 = numbers.reduce(0){$0 + $1}
var sum2 = numbers.reduce(0,+)

var colors = ["red","green","blue","black"]
var colorsStr = colors.reduce(""){
    if $0 != "" {
        return $0 + "," + $1
    } else {
        return $1
    }
}
println(colorsStr)

