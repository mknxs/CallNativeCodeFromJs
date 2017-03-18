//
//  APIProcess.swift
//  CallNativeCodeFromJs
//
//  Created by mkns on 2017/02/26.
//  Copyright © 2017年 smakino. All rights reserved.
//

import Foundation
import UIKit

class APIProcess {
    
    class Result {
        var result = false
        var data: AnyObject?
        
        func toDictionary() -> Dictionary<String, AnyObject> {
            var dict : Dictionary<String, AnyObject> = [
                APIHandler.JsonKeys.result: NSNumber.init(booleanLiteral: self.result),
                ]
            let dataKey = APIHandler.JsonKeys.data
            if let d = self.data {
                dict[dataKey] = d
            } else {
                dict[dataKey] = NSNull.init()
            }
            return dict
        }
    }
    
    var params: Dictionary<String, AnyObject>
    var callback = APIHandler.CallBack.None
    var keys = KeyPaths.shared
    
    required public init(params: Dictionary<String, AnyObject>, callback: APIHandler.CallBack) {
        self.params = params
        self.callback = callback
    }
    
    public func validate() -> Bool {
        // should override
        return true
    }
    
    public func execute(webView: UIWebView, completion: (Bool) -> ()) -> Bool {
        // should override
        return true
    }
    
    func finish(result: Result, webView: UIWebView, completion: (Bool) -> ()) {
        switch self.callback {
        case .FunctionName(_):
            if let callback = self.callback.getJsCode(arg: result.toDictionary()) {
                webView.stringByEvaluatingJavaScript(from: callback)
                completion(true)
            }
            break
        default:
            break
        }
        completion(false)
    }
}
