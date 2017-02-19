//
//  APIHandler.swift
//  CallNativeCodeFromJs
//
//  Created by mkns on 2017/02/19.
//  Copyright © 2017年 smakino. All rights reserved.
//

import Foundation

class APIHandler {
    
    let APIScheme = "smakino"
    
    func invoke(url: URL) -> Bool {
        if (url.scheme == APIScheme) {
            print("api called.")
            return true
        }
        
        // TODO: do process
        
        return true
    }
}
