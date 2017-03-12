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
    }
    
    var params: Dictionary<String, AnyObject>
    var callback = APIHandler.CallBack.None
    
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
        // TODO: js callback
        switch self.callback {
        case .FunctionName(_):
            break
        default:
            break
        }
        completion(false)
    }
}
