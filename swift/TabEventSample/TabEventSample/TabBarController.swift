//
//  TabBarController.swift
//  TabEventSample
//
//  Created by YasunoriTaga on 2015/06/07.
//  Copyright (c) 2015年 Yasuun. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        if viewController is TabBarDelegate {
            let v = viewController as TabBarDelegate
            v.didSelectTab(self)
        }
    }
}
