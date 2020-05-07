//
//  UIPageControl+SwiftyTheme.swift
//  SwiftyTheme
//
//  Created by 刘军 on 2020/5/5.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation
import UIKit

extension UIPageControl {
    fileprivate struct UIPageControlKeys {
        static var pageIndicatorTintColor_key = "com.yinhe.swiftyTheme.UIPageControl.pageIndicatorTintColor"
        static var currentPageIndicatorTintColor_key = "com.yinhe.swiftyTheme.UIPageControl.currentPageIndicatorTintColor"
    }
}

extension UIPageControl {
    
    @objc public var st_pageIndicatorTintColor: String? {
        get {
            return objc_getAssociatedObject(self, &UIPageControl.UIPageControlKeys.pageIndicatorTintColor_key) as? String
        }
        set {
            let sel = "setPageIndicatorTintColor:"
            let args: [SwiftyThemeColorKey] = [SwiftyThemeColorKey(key: newValue)]
            
            let themeObject = SwiftyThemeObject(selector: sel, args: args as [AnyObject], isEmpty: newValue == nil)
            
            SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
            
            objc_setAssociatedObject(self, &UIPageControl.UIPageControlKeys.pageIndicatorTintColor_key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    @objc public var st_currentPageIndicatorTintColor: String? {
        get {
            return objc_getAssociatedObject(self, &UIPageControl.UIPageControlKeys.currentPageIndicatorTintColor_key) as? String
        }
        set {
            let sel = "setCurrentPageIndicatorTintColor:"
            let args: [SwiftyThemeColorKey] = [SwiftyThemeColorKey(key: newValue)]
            
            let themeObject = SwiftyThemeObject(selector: sel, args: args as [AnyObject], isEmpty: newValue == nil)
            
            SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
            
            objc_setAssociatedObject(self, &UIPageControl.UIPageControlKeys.currentPageIndicatorTintColor_key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }   
}
