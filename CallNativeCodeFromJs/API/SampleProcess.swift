//
//  SampleProcess.swift
//  CallNativeCodeFromJs
//
//  Created by mkns on 2017/02/26.
//  Copyright © 2017年 smakino. All rights reserved.
//

import Foundation
import UIKit

class SampleProcess : APIProcess {
    
    public override func validate() -> Bool {
        return super.validate() && self.params["message"] != nil
    }
    
    public override func execute(webView: UIWebView, completion: (Bool) -> ()) -> Bool {
        let message = self.params["message"]
        print(message!);
        let r = Result.init()
        r.result = true
        self.finish(result: r, webView: webView, completion: completion)
        return true
    }
}
