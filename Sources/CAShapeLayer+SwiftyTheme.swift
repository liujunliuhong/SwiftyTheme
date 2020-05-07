//
//  CAShapeLayer+SwiftyTheme.swift
//  SwiftyTheme
//
//  Created by 刘军 on 2020/5/5.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation
import UIKit

extension CAShapeLayer {
    fileprivate struct CAShapeLayerKeys {
        static var fillColor_key = "com.yinhe.swiftyTheme.CAShapeLayer.fillColor"
        static var strokeColor_key = "com.yinhe.swiftyTheme.CAShapeLayer.strokeColor"
    }
}

extension CAShapeLayer {
    @objc public var st_fillColor: String? {
        get {
            return objc_getAssociatedObject(self, &CAShapeLayer.CAShapeLayerKeys.fillColor_key) as? String
        }
        set {
            let sel = "setFillColor:"
            let args: [SwiftyThemeColorKey] = [SwiftyThemeColorKey(key: newValue)]
            
            let themeObject = SwiftyThemeObject(selector: sel, args: args as [AnyObject], isEmpty: newValue == nil)
            
            SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
            
            objc_setAssociatedObject(self, &CAShapeLayer.CAShapeLayerKeys.fillColor_key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    @objc public var st_strokeColor: String? {
        get {
            return objc_getAssociatedObject(self, &CAShapeLayer.CAShapeLayerKeys.strokeColor_key) as? String
        }
        set {
            let sel = "setStrokeColor:"
            let args: [SwiftyThemeColorKey] = [SwiftyThemeColorKey(key: newValue)]
            
            let themeObject = SwiftyThemeObject(selector: sel, args: args as [AnyObject], isEmpty: newValue == nil)
            
            SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
            
            objc_setAssociatedObject(self, &CAShapeLayer.CAShapeLayerKeys.strokeColor_key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
}
