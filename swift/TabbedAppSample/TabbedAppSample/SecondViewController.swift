//
//  SecondViewController.swift
//  TabbedAppSample
//
//  Created by YasunoriTaga on 2015/06/03.
//  Copyright (c) 2015年 Yasuun. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
       // AppDelegateの取得
        var myAp = UIApplication.sharedApplication().delegate as AppDelegate
        myAp.myCount++

        println("2画面目 count=\(myAp.myCount)")
    }


}

