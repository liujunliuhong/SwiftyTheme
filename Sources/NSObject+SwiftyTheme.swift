//
//  NSObject+SwiftyTheme.swift
//  SwiftyTheme
//
//  Created by 刘军 on 2020/5/5.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation

public typealias SwiftyThemeChangeClosure = () -> ()

extension NSObject {
    @objc internal(set) public var st_themeChangeClosure: SwiftyThemeChangeClosure? {
        get {
            return objc_getAssociatedObject(self, &SwiftyThemeKeys.Closure.themeChangeClosure_key) as? SwiftyThemeChangeClosure
        }
        set {
            objc_setAssociatedObject(self, &SwiftyThemeKeys.Closure.themeChangeClosure_key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
}
