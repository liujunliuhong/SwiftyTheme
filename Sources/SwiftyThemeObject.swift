//
//  SwiftyThemeObject.swift
//  SwiftyTheme
//
//  Created by apple on 2020/5/7.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation
import UIKit


internal struct SwiftyThemeColorKey {
    let key: String?
    init(key: String?) {
        self.key = key
    }
}

internal struct SwiftyThemeImageKey {
    let key: String?
    init(key: String?) {
        self.key = key
    }
}

public struct SwiftyThemeObject {
    let isEmpty: Bool
    var selector: String
    var args: [AnyObject?]
    
    init(selector: String, args: [AnyObject?], isEmpty: Bool) {
        self.isEmpty = isEmpty
        self.selector = selector
        self.args = args
    }
}

extension SwiftyThemeObject: Equatable {
    public static func == (lhs: SwiftyThemeObject, rhs: SwiftyThemeObject) -> Bool {
        
        let res1 = lhs.selector == rhs.selector

        var res2: Bool = true
        if lhs.args.count == rhs.args.count {
            for (index, arg) in lhs.args.enumerated() {
                if let arg1 = arg,
                    let arg2 = rhs.args[index] {
                    if !(arg1.isEqual(arg2)) {
                        res2 = false
                        break
                    }
                } else {
                    res2 = false
                    break
                }
            }
        } else {
            res2 = false
        }

        return res1 && res2
        
        //return lhs.selector == rhs.selector
    }
}
