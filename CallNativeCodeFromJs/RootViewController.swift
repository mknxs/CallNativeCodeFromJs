//
//  RootViewController.swift
//  CallNativeCodeFromJs
//
//  Created by mkns on 2017/02/18.
//  Copyright © 2017年 smakino. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = "https://www.google.com"
        self.webView.loadRequest(URLRequest(url: URL(string: url)!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
