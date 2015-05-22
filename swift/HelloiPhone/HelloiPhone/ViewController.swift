//
//  ViewController.swift
//  HelloiPhone
//
//  Created by YasunoriTaga on 2015/05/21.
//  Copyright (c) 2015年 Yasuun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // ラベル
    @IBOutlet weak var myLabel: UILabel!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        // 日付のフォーマットを指定
        let fmt = NSDateFormatter()
        fmt.locale = NSLocale(localeIdentifier: "ja_JP")
        fmt.timeStyle = .FullStyle
        fmt.dateStyle = .NoStyle
        
        var now = NSDate()
        self.myLabel.text = fmt.stringFromDate(now)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // 日本のロケールを設定
        let jaLocale = NSLocale(localeIdentifier: "ja_JP")
        
        // 日本のフォーマット
        let fmt = NSDateFormatter()
        fmt.locale = jaLocale
        
        // 時間はなし
        fmt.timeStyle = .NoStyle
        
        // 日付はロングスタイル
        fmt.dateStyle = .LongStyle
        
        // 現在時刻
        var now = NSDate()
        
        // ラベルに日付を表示する
        self.myLabel.text = fmt.stringFromDate(now)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

