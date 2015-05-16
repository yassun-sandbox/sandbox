//
//  Person.swift
//  ClubMember
//
//  Created by YasunoriTaga on 2015/05/16.
//  Copyright (c) 2015年 Yasuun. All rights reserved.
//

import Foundation

class Person {
    let name:String
    var bithday:NSData
    var height: Double

    private let BMI = 22.0

    init(name: String, birthday: NSData, height: Double) {
        self.name = name
        self.bithday = birthday
        self.height = height
    }

    convenience init(name:String, birthday: NSData) {
        self.init(name:name, birthday:birthday, height:0)
    }
}
