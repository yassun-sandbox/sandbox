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
func stdWeight(heightCm height: Double, bmiValue bmi: Double) -> Double{
    var heightM = height / 100.0
    return heightM * heightM * bmi
}

let height = 180.0
let w1 = stdWeight(heightCm: height, bmiValue: 22.0)
