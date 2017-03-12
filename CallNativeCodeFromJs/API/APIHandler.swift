//
//  APIHandler.swift
//  CallNativeCodeFromJs
//
//  Created by mkns on 2017/02/19.
//  Copyright © 2017年 smakino. All rights reserved.
//

import Foundation
import UIKit

class APIHandler {
    
    let APIScheme = "smakino"
    let APIHost = "api"
    
    public enum Method : String {
        case Unknown = "unknown"
        case Sample = "sample"
    }
    
    public enum CallBack {
        case None
        case FunctionName(String)
    }
    
    /**
     * url: smakino://api/{method}/{options}/{callback}
     */
    func invoke(url: URL, webView: UIWebView) -> Bool {
        if (url.scheme != APIScheme || url.host != APIHost) {
            return true
        }
        
        let completion = { (result: Bool) -> () in
            // currently do nothing.
        }
        
        let path = url.path
        if let process = self.prepareProcess(path: path, webView: webView) {
            if process.validate() {
                return process.execute(webView: webView, completion: completion)
            }
        }
        
        return false
    }
    
    fileprivate func extractParameters(paramString: String, webView: UIWebView) -> Dictionary<String, AnyObject> {
        if let s = webView.stringByEvaluatingJavaScript(from: paramString) {
            if let d = s.data(using: .utf8) {
                if let dict = try? JSONSerialization.jsonObject(with: d) as? Dictionary<String, AnyObject> {
                    return dict!
                }
            }
        }

        return [:]
    }
    
    /**
     * path: /{method}/{params}/{callback}
     */
    fileprivate func prepareProcess(path: String, webView: UIWebView) -> APIProcess? {
        var cs = [String]()
        path.components(separatedBy: "/").forEach({ (s) in
            if !s.isEmpty {
                cs.append(s)
            }
        })
        
        if let methodString = cs.first {
            if let method = Method.init(rawValue: methodString) {
                let params = self.extractParameters(paramString: cs[1], webView: webView)
                let callack = CallBack.FunctionName(cs[2])
                var t = APIProcess.self
                switch method {
                case .Sample:
                    t = SampleProcess.self
                    break
                default:
                    
                    break
                }
                
                return t.init(params: params, callback: callack)
            }
        }
        return nil
    }
}
