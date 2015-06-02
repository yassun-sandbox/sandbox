//
//  ViewController.swift
//  SingleViewAppPageMove
//
//  Created by YasunoriTaga on 2015/06/02.
//  Copyright (c) 2015年 Yasuun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 画面切り替え時の処理
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        // 該当セグエの場合
        if(segue.identifier == "mySegue"){
            myCount++
            // 値の受け渡し
            let navigationController = segue.destinationViewController as UINavigationController
            let vc = navigationController.viewControllers[0] as nextViewController
            vc.tmpCount = myCount
        }
    }
    
    @IBAction func returnMenu(segue: UIStoryboardSegue) {
        let newVc = segue.sourceViewController as nextViewController
        myCount++
        println("前の画面から持っどってきた時のmyCount=\(myCount)")
    }

}

