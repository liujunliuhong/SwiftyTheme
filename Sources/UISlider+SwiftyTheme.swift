//
//  UISlider+SwiftyTheme.swift
//  SwiftyTheme
//
//  Created by 刘军 on 2020/5/5.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation
import UIKit


extension UISlider {
    fileprivate struct UISliderKeys {
        static var thumbTintColor_key = "com.yinhe.swiftyTheme.UISlider.thumbTintColor"
        static var minimumTrackTintColor_key = "com.yinhe.swiftyTheme.UISlider.minimumTrackTintColor"
        static var maximumTrackTintColor_key = "com.yinhe.swiftyTheme.UISlider.maximumTrackTintColor"
        
        static var thumbImage_key = "com.yinhe.swiftyTheme.UISlider.thumbImage"
        static var maximumTrackImage_key = "com.yinhe.swiftyTheme.UISlider.maximumTrackImage"
        static var minimumTrackImage_key = "com.yinhe.swiftyTheme.UISlider.minimumTrackImage"
    }
}

extension UISlider {
    
    @objc public var st_thumbTintColor: String? {
        get {
            return objc_getAssociatedObject(self, &UISlider.UISliderKeys.thumbTintColor_key) as? String
        }
        set {
            let sel = "setThumbTintColor:"
            let args: [SwiftyThemeColorKey] = [SwiftyThemeColorKey(key: newValue)]
            
            let themeObject = SwiftyThemeObject(selector: sel, args: args as [AnyObject], isEmpty: newValue == nil)
            
            SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
            
            objc_setAssociatedObject(self, &UISlider.UISliderKeys.thumbTintColor_key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    @objc public var st_minimumTrackTintColor: String? {
        get {
            return objc_getAssociatedObject(self, &UISlider.UISliderKeys.minimumTrackTintColor_key) as? String
        }
        set {
            let sel = "setMinimumTrackTintColor:"
            let args: [SwiftyThemeColorKey] = [SwiftyThemeColorKey(key: newValue)]
            
            let themeObject = SwiftyThemeObject(selector: sel, args: args as [AnyObject], isEmpty: newValue == nil)
            
            SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
            
            objc_setAssociatedObject(self, &UISlider.UISliderKeys.minimumTrackTintColor_key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    @objc public var st_maximumTrackTintColor: String? {
        get {
            return objc_getAssociatedObject(self, &UISlider.UISliderKeys.maximumTrackTintColor_key) as? String
        }
        set {
            let sel = "setMaximumTrackTintColor:"
            let args: [SwiftyThemeColorKey] = [SwiftyThemeColorKey(key: newValue)]
            
            let themeObject = SwiftyThemeObject(selector: sel, args: args as [AnyObject], isEmpty: newValue == nil)
            
            SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
            
            objc_setAssociatedObject(self, &UISlider.UISliderKeys.maximumTrackTintColor_key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
}

extension UISlider {
    @objc public func st_setThumbImage(_ image: String?, for state: UIControl.State) {
        let sel = "setThumbImage:forState:"
        let args: [AnyObject] = [SwiftyThemeImageKey(key: image) as AnyObject, NSNumber(value: state.rawValue)]
        let themeObject = SwiftyThemeObject(selector: sel, args: args, isEmpty: image == nil)
        SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
    }
    
    @objc public func st_setMinimumTrackImage(_ image: String?, for state: UIControl.State) {
        let sel = "setMinimumTrackImage:forState:"
        let args: [AnyObject] = [SwiftyThemeImageKey(key: image) as AnyObject, NSNumber(value: state.rawValue)]
        let themeObject = SwiftyThemeObject(selector: sel, args: args, isEmpty: image == nil)
        SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
    }
    
    @objc public func st_setMaximumTrackImage(_ image: String?, for state: UIControl.State) {
        let sel = "setMaximumTrackImage:forState:"
        let args: [AnyObject] = [SwiftyThemeImageKey(key: image) as AnyObject, NSNumber(value: state.rawValue)]
        let themeObject = SwiftyThemeObject(selector: sel, args: args, isEmpty: image == nil)
        SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
    }
}


