//
//  OpenUrlProcess.swift
//  CallNativeCodeFromJs
//
//  Created by mkns on 2017/03/18.
//  Copyright © 2017年 smakino. All rights reserved.
//

import Foundation
import UIKit

class OpenUrlProcess : APIProcess {
    
    public override func validate() -> Bool {
        return super.validate() && self.params[self.keys.url] != nil
    }
    
    public override func execute(webView: UIWebView, completion: (Bool) -> ()) -> Bool {
        let urlString = self.params[self.keys.url] as! String
        let r = Result.init()
        let url = URL(string: urlString)!
        let app = UIApplication.shared
        if app.canOpenURL(url) {
            app.open(url, options: [:], completionHandler: nil)
            r.result = true
        } else {
            r.result = false
            r.data = "could not open url" as AnyObject?
        }
        
        self.finish(result: r, webView: webView, completion: completion)
        return true
    }
}
