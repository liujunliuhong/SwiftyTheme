//
//  UIImageView+SwiftyTheme.swift
//  SwiftyTheme
//
//  Created by apple on 2020/5/6.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    fileprivate struct UIImageViewKeys {
        static var image_key = "com.yinhe.swiftyTheme.UIImageView.image"
    }
}

extension UIImageView {
    
    @objc public var st_image: String? {
        get {
            objc_getAssociatedObject(self, &UIImageView.UIImageViewKeys.image_key) as? String
        }
        set {
            let sel = "setImage:"
            let args: [SwiftyThemeImageKey] = [SwiftyThemeImageKey(key: newValue)]
            
            let themeObject = SwiftyThemeObject(selector: sel, args: args as [AnyObject], isEmpty: newValue == nil)
            
            SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
            
            objc_setAssociatedObject(self, &UIImageView.UIImageViewKeys.image_key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
}
