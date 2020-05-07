//
//  UILabel+SwiftyTheme.swift
//  SwiftyTheme
//
//  Created by 刘军 on 2020/5/5.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    fileprivate struct UILabelKeys {
        static var textColor_key = "com.yinhe.swiftyTheme.UILabel.textColor"
        static var highlightedTextColor_key = "com.yinhe.swiftyTheme.UILabel.highlightedTextColor"
        static var shadowColor_key = "com.yinhe.swiftyTheme.UILabel.shadowColor"
    }
}

extension UILabel {
    @objc public var st_textColor: String? {
        get {
            return objc_getAssociatedObject(self, &UILabel.UILabelKeys.textColor_key) as? String
        }
        set {
            let sel = "setTextColor:"
            let args: [SwiftyThemeColorKey] = [SwiftyThemeColorKey(key: newValue)]
            
            let themeObject = SwiftyThemeObject(selector: sel, args: args as [AnyObject], isEmpty: newValue == nil)
            
            SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
            
            objc_setAssociatedObject(self, &UILabel.UILabelKeys.textColor_key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    @objc public var st_highlightedTextColor: String? {
        get {
            return objc_getAssociatedObject(self, &UILabel.UILabelKeys.highlightedTextColor_key) as? String
        }
        set {
            let sel = "setHighlightedTextColor:"
            let args: [SwiftyThemeColorKey] = [SwiftyThemeColorKey(key: newValue)]
            
            let themeObject = SwiftyThemeObject(selector: sel, args: args as [AnyObject], isEmpty: newValue == nil)
            
            SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
            
            objc_setAssociatedObject(self, &UILabel.UILabelKeys.highlightedTextColor_key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    @objc public var st_shadowColor: String? {
        get {
            return objc_getAssociatedObject(self, &UILabel.UILabelKeys.shadowColor_key) as? String
        }
        set {
            let sel = "setShadowColor:"
            let args: [SwiftyThemeColorKey] = [SwiftyThemeColorKey(key: newValue)]
            
            let themeObject = SwiftyThemeObject(selector: sel, args: args as [AnyObject], isEmpty: newValue == nil)
            
            SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
            
            objc_setAssociatedObject(self, &UILabel.UILabelKeys.shadowColor_key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
}
