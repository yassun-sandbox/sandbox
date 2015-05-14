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
