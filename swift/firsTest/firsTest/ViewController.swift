//
//  ViewController.swift
//  firsTest
//
//  Created by YasunoriTaga on 2015/05/27.
//  Copyright (c) 2015年 Yasuun. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBAction func changeSwitch(sender: UISwitch) {
        if sender.on == true{
            myLabel.text = "ON"
        }else{
            myLabel.text = "OFF"
        }
    }
    
    @IBOutlet weak var myPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = "Hi!!!!"
        myPicker.dataSource = self
        myPicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // UIPickerViewDataSource Delegate
    var tea_list = ["お茶","抹茶","紅茶","緑茶"]
    
    // 列数
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    // 行数
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tea_list.count

    }

    // 表示文言
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return tea_list[row]
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myLabel.text = "選択されたのは\(row)行目で\(tea_list[row])です。"
    }

    

    
}

