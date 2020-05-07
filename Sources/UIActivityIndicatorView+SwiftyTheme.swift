//
//  UIActivityIndicatorView+SwiftyTheme.swift
//  SwiftyTheme
//
//  Created by apple on 2020/5/7.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation
import UIKit

extension UIActivityIndicatorView {
    fileprivate struct UIActivityIndicatorViewKeys {
        static var color_key = "com.yinhe.swiftyTheme.UIActivityIndicatorView.color"
    }
}

extension UIActivityIndicatorView {
    @objc public var st_color: String? {
        get {
            return objc_getAssociatedObject(self, &UIActivityIndicatorView.UIActivityIndicatorViewKeys.color_key) as? String
        }
        set {
            let sel = "setColor:"
            let args: [SwiftyThemeColorKey] = [SwiftyThemeColorKey(key: newValue)]
            
            let themeObject = SwiftyThemeObject(selector: sel, args: args as [AnyObject], isEmpty: newValue == nil)
            
            SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
            
            objc_setAssociatedObject(self, &UIActivityIndicatorView.UIActivityIndicatorViewKeys.color_key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
}
