//
//  UISwitch+SwiftyTheme.swift
//  SwiftyTheme
//
//  Created by 刘军 on 2020/5/5.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation
import UIKit

extension UISwitch {
    fileprivate struct UISwitchKeys {
        static var onTintColor_key = "com.yinhe.swiftyTheme.UISwitch.onTintColor"
        static var thumbTintColor_key = "com.yinhe.swiftyTheme.UISwitch.thumbTintColor"
    }
}


extension UISwitch {
    @objc public var st_onTintColor: String? {
        get {
            return objc_getAssociatedObject(self, &UISwitch.UISwitchKeys.onTintColor_key) as? String
        }
        set {
            let sel = "setOnTintColor:"
            let args: [SwiftyThemeColorKey] = [SwiftyThemeColorKey(key: newValue)]
            
            let themeObject = SwiftyThemeObject(selector: sel, args: args as [AnyObject], isEmpty: newValue == nil)
            
            SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
            
            objc_setAssociatedObject(self, &UISwitch.UISwitchKeys.onTintColor_key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    @objc public var st_thumbTintColor: String? {
        get {
            return objc_getAssociatedObject(self, &UISwitch.UISwitchKeys.thumbTintColor_key) as? String
        }
        set {
            let sel = "setThumbTintColor:"
            let args: [SwiftyThemeColorKey] = [SwiftyThemeColorKey(key: newValue)]
            
            let themeObject = SwiftyThemeObject(selector: sel, args: args as [AnyObject], isEmpty: newValue == nil)
            
            SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
            
            objc_setAssociatedObject(self, &UISwitch.UISwitchKeys.thumbTintColor_key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
}

