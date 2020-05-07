//
//  UIProgressView+SwiftyTheme.swift
//  SwiftyTheme
//
//  Created by 刘军 on 2020/5/5.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation
import UIKit

extension UIProgressView {
    fileprivate struct UIProgressViewKeys {
        static var progressTintColor_key = "com.yinhe.swiftyTheme.UIProgressView.progressTintColor"
        static var trackTintColor_key = "com.yinhe.swiftyTheme.UIProgressView.trackTintColor"
        
        static var progressImage_key = "com.yinhe.swiftyTheme.UIProgressView.progressImage"
        static var trackImage_key = "com.yinhe.swiftyTheme.UIProgressView.trackImage"
    }
}


extension UIProgressView {
    
    @objc public var st_progressTintColor: String? {
        get {
            return objc_getAssociatedObject(self, &UIProgressView.UIProgressViewKeys.progressTintColor_key) as? String
        }
        set {
            let sel = "setProgressTintColor:"
            let args: [SwiftyThemeColorKey] = [SwiftyThemeColorKey(key: newValue)]
            
            let themeObject = SwiftyThemeObject(selector: sel, args: args as [AnyObject], isEmpty: newValue == nil)
            
            SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
            
            objc_setAssociatedObject(self, &UIProgressView.UIProgressViewKeys.progressTintColor_key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    @objc public var st_trackTintColor: String? {
        get {
            return objc_getAssociatedObject(self, &UIProgressView.UIProgressViewKeys.trackTintColor_key) as? String
        }
        set {
            let sel = "setTrackTintColor:"
            let args: [SwiftyThemeColorKey] = [SwiftyThemeColorKey(key: newValue)]
            
            let themeObject = SwiftyThemeObject(selector: sel, args: args as [AnyObject], isEmpty: newValue == nil)
            
            SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
            
            objc_setAssociatedObject(self, &UIProgressView.UIProgressViewKeys.trackTintColor_key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
}



extension UIProgressView {
    @objc public var st_progressImage: String? {
        get {
            return objc_getAssociatedObject(self, &UIProgressView.UIProgressViewKeys.progressImage_key) as? String
        }
        set {
            let sel = "setProgressImage:"
            let args: [SwiftyThemeImageKey] = [SwiftyThemeImageKey(key: newValue)]
            
            let themeObject = SwiftyThemeObject(selector: sel, args: args as [AnyObject], isEmpty: newValue == nil)
            
            SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
            
            objc_setAssociatedObject(self, &UIProgressView.UIProgressViewKeys.progressImage_key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
  
    @objc public var st_trackImage: String? {
        get {
            return objc_getAssociatedObject(self, &UIProgressView.UIProgressViewKeys.trackImage_key) as? String
        }
        set {
            let sel = "setTrackImage:"
            let args: [SwiftyThemeImageKey] = [SwiftyThemeImageKey(key: newValue)]
            
            let themeObject = SwiftyThemeObject(selector: sel, args: args as [AnyObject], isEmpty: newValue == nil)
            
            SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
            
            objc_setAssociatedObject(self, &UIProgressView.UIProgressViewKeys.trackImage_key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
}
