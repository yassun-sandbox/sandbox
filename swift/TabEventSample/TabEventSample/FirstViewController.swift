//
//  FirstViewController.swift
//  TabEventSample
//
//  Created by YasunoriTaga on 2015/06/07.
//  Copyright (c) 2015年 Yasuun. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, TabBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func didSelectTab(tabBarController: TabBarController) {
        println("first!")
    }
}

