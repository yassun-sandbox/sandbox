//
//  main.swift
//  SwiftStudy
//
//  Created by YasunoriTaga on 2015/05/07.
//  Copyright (c) 2015年 Yasuun. All rights reserved.
//

import Foundation

// Optional

// int型のオプショナル
var num:Int? = 5

// アンラップ
var sum = num! + 5


// 配列
var names = ["hoge","huga","hega"]

// 辞書
var customers = [10: "HOGE",11: "HUGA",12:"HEGA"]

// 外部引数
func stdWeight(heightCm height: Double, bmi: Double = 22.0) -> Double{
    var heightM = height / 100.0
    return heightM * heightM * bmi
}

let height = 180.0
let w1 = stdWeight(heightCm: height, bmi: 22.0)

// タプルを返却する関数
func maxMin(v1:Double, v2:Double, v3:Double) -> (Double, Double) {
    var maxValue = max(v1, v2, v3)
    var minValue = min(v1, v2, v3)
    return (maxValue, minValue)
}
var (max1, min1) = maxMin(9.5, 3.0, 10.0)
println("max: \(max1), min:\(min1)")
