//
//  ViewController.swift
//  WebViewTest
//
//  Created by YasunoriTaga on 2015/05/31.
//  Copyright (c) 2015年 Yasuun. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet weak var myWebView: UIWebView!
    @IBOutlet weak var homeTabButton: UITabBarItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myWebView.delegate = self
        
        var myURL = NSURL(string: "http://www.sttend.com/")
        var myURLReq = NSURLRequest(URL: myURL!)
        
        myWebView.loadRequest(myURLReq)
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

