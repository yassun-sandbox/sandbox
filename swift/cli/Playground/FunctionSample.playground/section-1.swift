// Playground - noun: a place where people can play

import Cocoa

// 可変引数
func multiplyAll(nums: Double...) -> Double {
    if nums.isEmpty{
        return 0.0
    }
    var result = 1.0
    for num in nums {
        result *= num
    }
    return result
}

let m0 = multiplyAll()
let m1 = multiplyAll(4.0, 5.0, 1.5)
let m2 = multiplyAll(4.0, 5.0, 1.5, 2.0)

// 引数はデフォルトではlet
// 明示的にverをつける必要がある
func cmToInch(var cm: Double) -> Double {
    cm = cm * 0.3937
    return cm
}

