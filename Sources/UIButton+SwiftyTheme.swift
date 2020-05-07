//
//  UIButton+SwiftyTheme.swift
//  SwiftyTheme
//
//  Created by 刘军 on 2020/5/5.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation
import UIKit


extension UIButton {
    fileprivate struct UIButtonKeys {
        static var titleColor_key = "com.yinhe.swiftyTheme.UIButton.titleColor"
        static var image_key = "com.yinhe.swiftyTheme.UIButton.image"
        static var backgroundImage_key = "com.yinhe.swiftyTheme.UIButton.backgroundImage"
    }
}

extension UIButton {
    @objc public func st_setTitleColor(_ color: String?, forState state: UIControl.State) {
        let sel = "setTitleColor:forState:"
        let args: [AnyObject] = [SwiftyThemeColorKey(key: color) as AnyObject, NSNumber(value: state.rawValue)]
        let themeObject = SwiftyThemeObject(selector: sel, args: args, isEmpty: color == nil)
        SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
    }
}

extension UIButton {
    @objc public func st_setImage(_ image: String?, forState state: UIControl.State) {
        let sel = "setImage:forState:"
        let args: [AnyObject] = [SwiftyThemeImageKey(key: image) as AnyObject, NSNumber(value: state.rawValue)]
        let themeObject = SwiftyThemeObject(selector: sel, args: args, isEmpty: image == nil)
        SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
    }
    
    @objc public func st_setBackgroundImage(_ image: String?, forState state: UIControl.State) {
        let sel = "setBackgroundImage:forState:"
        let args: [AnyObject] = [SwiftyThemeImageKey(key: image) as AnyObject, NSNumber(value: state.rawValue)]
        let themeObject = SwiftyThemeObject(selector: sel, args: args, isEmpty: image == nil)
        SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
    }
}
