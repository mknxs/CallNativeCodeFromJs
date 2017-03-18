//
//  RootViewController.swift
//  CallNativeCodeFromJs
//
//  Created by mkns on 2017/02/18.
//  Copyright © 2017年 smakino. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    let handler = APIHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = self.indexFileURL {
            self.webView.loadRequest(URLRequest(url: url))
        }
        
        self.webView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
        
    fileprivate var indexFileURL: URL? {
        get {
            return URL(string: Bundle.main.path(forResource: "index", ofType: "html", inDirectory: "assets")!)
        }
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if let url = request.url {
            return self.handler.invoke(url: url, webView: webView)
        } else {
            return true
        }
    }
}
