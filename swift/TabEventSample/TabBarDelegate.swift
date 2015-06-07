//
//  TabBarDelegate.swift
//  TabEventSample
//
//  Created by YasunoriTaga on 2015/06/07.
//  Copyright (c) 2015年 Yasuun. All rights reserved.
//

import Foundation

@objc protocol TabBarDelegate {
    
    func didSelectTab(tabBarController: TabBarController)
    
}
