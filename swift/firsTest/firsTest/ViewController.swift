//
//  ViewController.swift
//  firsTest
//
//  Created by YasunoriTaga on 2015/05/27.
//  Copyright (c) 2015年 Yasuun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    @IBAction func changeSwitch(sender: UISwitch) {
        if sender.on == true{
            myLabel.text = "ON"
        }else{
            myLabel.text = "OFF"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myLabel.text = "Hi!!!!"
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

