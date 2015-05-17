//
//  main.swift
//  RobotSample
//
//  Created by YasunoriTaga on 2015/05/17.
//  Copyright (c) 2015年 Yasuun. All rights reserved.
//

import Foundation


// ストアド・プロパティ(保持型プロパティ)
class Robot1 {
    let name:String = "ロボット"
    var heightCm: Double = 10.5
    init(name: String, heightCm: Double) {
        self.name = name
        self.heightCm = heightCm
    }
}
var r1 = Robot1(name:"R2D2", heightCm: 15.0)

// コンピューテッド・プロパティ
class Robot2 {
    let name:String = "ロボット"
    var heightCm: Double = 10.5
    var heightInch: Double {
        get {
            return heightCm / 2.54
        }
        set(newHeight){
            heightCm = newHeight * 2.54
        }
    }

    init(name: String, heightCm: Double) {
        self.name = name
        self.heightCm = heightCm
    }
}

var r2 = Robot2(name:"R3D3", heightCm: 15.0)
println("\(r2.heightInch)")
r2.heightInch = 10.0
println("\(r2.heightInch)")
