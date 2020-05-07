//
//  CALayer+SwiftyTheme.swift
//  SwiftyTheme
//
//  Created by 刘军 on 2020/5/5.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation
import UIKit

extension CALayer {
    fileprivate struct CALayerKeys {
        static var backgroundColor_key = "com.yinhe.swiftyTheme.CALayer.backgroundColor"
        static var borderColor_key = "com.yinhe.swiftyTheme.CALayer.borderColor"
        static var shadowColor_key = "com.yinhe.swiftyTheme.CALayer.shadowColor"
        static var contents_key = "com.yinhe.swiftyTheme.CALayer.contens"
    }
}


extension CALayer {
    
    @objc public var st_backgroundColor: String? {
        get {
            return objc_getAssociatedObject(self, &CALayer.CALayerKeys.backgroundColor_key) as? String
        }
        set {
            let sel = "setBackgroundColor:"
            let args: [SwiftyThemeColorKey] = [SwiftyThemeColorKey(key: newValue)]
            
            let themeObject = SwiftyThemeObject(selector: sel, args: args as [AnyObject], isEmpty: newValue == nil)
            
            SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
            
            objc_setAssociatedObject(self, &CALayer.CALayerKeys.backgroundColor_key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    @objc public var st_borderColor: String? {
        get {
            return objc_getAssociatedObject(self, &CALayer.CALayerKeys.borderColor_key) as? String
        }
        set {
            let sel = "setBorderColor:"
            let args: [SwiftyThemeColorKey] = [SwiftyThemeColorKey(key: newValue)]
            
            let themeObject = SwiftyThemeObject(selector: sel, args: args as [AnyObject], isEmpty: newValue == nil)
            
            SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
            
            objc_setAssociatedObject(self, &CALayer.CALayerKeys.borderColor_key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    @objc public var st_shadowColor: String? {
        get {
            return objc_getAssociatedObject(self, &CALayer.CALayerKeys.shadowColor_key) as? String
        }
        set {
            let sel = "setShadowColor:"
            let args: [SwiftyThemeColorKey] = [SwiftyThemeColorKey(key: newValue)]
            
            let themeObject = SwiftyThemeObject(selector: sel, args: args as [AnyObject], isEmpty: newValue == nil)
            
            SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
            
            objc_setAssociatedObject(self, &CALayer.CALayerKeys.shadowColor_key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
}

extension CALayer {
    
    @objc public var st_contents: String? {
        get {
            objc_getAssociatedObject(self, &CALayer.CALayerKeys.contents_key) as? String
        }
        set {
            let sel = "setContents:"
            let args: [SwiftyThemeImageKey] = [SwiftyThemeImageKey(key: newValue)]
            
            let themeObject = SwiftyThemeObject(selector: sel, args: args as [AnyObject], isEmpty: newValue == nil)
            
            SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
            
            objc_setAssociatedObject(self, &CALayer.CALayerKeys.contents_key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
}
