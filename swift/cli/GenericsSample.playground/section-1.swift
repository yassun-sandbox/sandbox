// Playground - noun: a place where people can play

import Cocoa

func showParam<T>(item: T) -> String {
    return "引数：\(item)"
}
showParam(1)
showParam("hoge")
