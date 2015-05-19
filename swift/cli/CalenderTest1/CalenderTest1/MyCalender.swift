//
//  MyCalender.swift
//  CalenderTest1
//
//  Created by YasunoriTaga on 2015/05/19.
//  Copyright (c) 2015年 Yasuun. All rights reserved.
//

import Foundation

class MyCalender {
    
    // 年
    var year: Int
    
    // 月
    var month: Int
    
    private let gCal = NSCalendar(identifier: NSGregorianCalendar)!
    
    init() {
        let today = NSData()
        let flags:NSCalendarUnit = NSCalendarUnit.CalendarUnitYear | NSCalendarUnit.CalendarUnitMonth
        let comps = gCal.components(unitFlags: flags, fromDate: today)
        year = comps.year
        month = comps.month
    }
    
    
}
