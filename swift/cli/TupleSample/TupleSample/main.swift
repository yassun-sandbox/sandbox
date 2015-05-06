//
//  main.swift
//  TupleSample
//
//  Created by YasunoriTaga on 2015/05/06.
//  Copyright (c) 2015年 Yasuun. All rights reserved.
//

import Foundation


var tuple1 = ("Yasuun", 27)

var (name1, age1) = tuple1

var (name2, _) = tuple1

var tuple2 = (name: "Yasuun", age:27)

var myName = tuple2.name
var age    = tuple2.age


