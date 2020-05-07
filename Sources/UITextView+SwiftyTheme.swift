//
//  UITextView+SwiftyTheme.swift
//  SwiftyTheme
//
//  Created by apple on 2020/5/7.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation
import UIKit

extension UITextView {
    fileprivate struct UITextViewKeys {
        static var textColor_key = "com.yinhe.swiftyTheme.UITextView.textColor"
    }
}

extension UITextView {
    @objc public var st_textColor: String? {
        get {
            return objc_getAssociatedObject(self, &UITextView.UITextViewKeys.textColor_key) as? String
        }
        set {
            let sel = "setTextColor:"
            let args: [SwiftyThemeColorKey] = [SwiftyThemeColorKey(key: newValue)]
            
            let themeObject = SwiftyThemeObject(selector: sel, args: args as [AnyObject], isEmpty: newValue == nil)
            
            SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
            
            objc_setAssociatedObject(self, &UITextView.UITextViewKeys.textColor_key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
}
