//
//  FirstViewController.swift
//  TabbedAppSample
//
//  Created by YasunoriTaga on 2015/06/03.
//  Copyright (c) 2015年 Yasuun. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 画面が表示された場合
    override func viewWillAppear(animate: Bool) {

        // AppDelegateの取得
        var myAp = UIApplication.sharedApplication().delegate as AppDelegate
        myAp.myCount++

        println("1画面目 count=\(myAp.myCount)")
    }

}

