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
    internal(set) public var st_themes: [SwiftyThemeObject] {
        get {
            return (objc_getAssociatedObject(self, &SwiftyThemeKeys.Themes.key) as? [SwiftyThemeObject]) ?? []
        }
        set {
            objc_setAssociatedObject(self, &SwiftyThemeKeys.Themes.key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @objc internal(set) public var st_themeChangeClosure: SwiftyThemeChangeClosure? {
        get {
            return objc_getAssociatedObject(self, &SwiftyThemeKeys.Closure.themeChangeClosure_key) as? SwiftyThemeChangeClosure
        }
        set {
            objc_setAssociatedObject(self, &SwiftyThemeKeys.Closure.themeChangeClosure_key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
}
