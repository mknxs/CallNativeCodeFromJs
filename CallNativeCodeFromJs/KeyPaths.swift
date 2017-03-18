//
//  KeyPaths.swift
//  CallNativeCodeFromJs
//
//  Created by mkns on 2017/03/18.
//  Copyright © 2017年 smakino. All rights reserved.
//

import Foundation

/**
 キー値定義クラス
 プロパティを定義するとプロパティ名が値にセットされる
 */
class KeyPaths : NSObject {
    
    var message: String!
    var url: String!
    
    static let shared = KeyPaths()
    
    override private init() {
        super.init()
        self.propertyNames.forEach { (s) in
            self.setValue(s, forKey:s)
        }
    }
    
    var propertyNames: [String] {
        get {
            return Mirror(reflecting: self).children.filter {
                $0.label != nil
                }.map { $0.label! }
        }
    }
}
