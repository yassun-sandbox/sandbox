//
//  nextViewController.swift
//  SingleViewAppPageMove
//
//  Created by YasunoriTaga on 2015/06/02.
//  Copyright (c) 2015年 Yasuun. All rights reserved.
//

import UIKit

class nextViewController: UIViewController {
    
    var tmpCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        println("次の画面が表示されたとき\(tmpCount)")
    }
}
