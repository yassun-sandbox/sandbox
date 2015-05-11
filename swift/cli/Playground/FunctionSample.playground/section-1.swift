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

// 引数の参照渡し
func squaredNumber(inout num:Int){
    num = num * num
}
var aNum = 4
squaredNumber(&aNum)
println(aNum)

// 関数を返す関数
func fortune(chooseHappy: Bool) -> () -> String {
    func happyKuji() -> String {
        var kujis = ["大吉","大吉","大吉","大吉","大吉","凶"]
        var max = UInt32(kujis.count)
        var index = Int(arc4random_uniform(max))
        return "ハッピーくじ： " + kujis[index]
    }
    
   func unhappyKuji() -> String {
        var kujis = ["大吉","凶","凶","凶","凶","凶","凶"]
        var max = UInt32(kujis.count)
        var index = Int(arc4random_uniform(max))
        return "残念くじ： " + kujis[index]
    }
    
    if chooseHappy {
        return happyKuji
    }else{
        return unhappyKuji
    }
}

var myKuji = fortune(true)
for _ in 1...10 {
    println(myKuji())
}
myKuji = fortune(false)
for _ in 1...10 {
    println(myKuji())
}



