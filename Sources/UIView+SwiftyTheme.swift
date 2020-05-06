//
//  UIView+SwiftyTheme.swift
//  SwiftyTheme
//
//  Created by 刘军 on 2020/5/5.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    fileprivate struct UIViewKeys {
        static var backgroundColor_key = "com.yinhe.swiftyTheme.UIView.backgroundColor"
        static var tintColor_key = "com.yinhe.swiftyTheme.UIView.tintColor"
    }
}

extension UIView {
    
    @objc public var st_backgroundColor: String? {
        get {
            return objc_getAssociatedObject(self, &UIView.UIViewKeys.backgroundColor_key) as? String
        }
        set {
            let sel = "setBackgroundColor:"
            let args: [String?] = [newValue]
            
            let themeObject = SwiftyThemeColorObject(sel: sel, args: args as [Any])
            
            SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
            
            objc_setAssociatedObject(self, &UIView.UIViewKeys.backgroundColor_key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    
    @objc public var st_tintColor: String? {
        get { return objc_getAssociatedObject(self, &UIView.UIViewKeys.tintColor_key) as? String }
        set {
            let sel = "setTintColor:"
            let args: [String?] = [newValue]
            
            let themeObject = SwiftyThemeColorObject(sel: sel, args: args as [Any])
            
            
            
            SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
            
            objc_setAssociatedObject(self, &UIView.UIViewKeys.tintColor_key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
}
