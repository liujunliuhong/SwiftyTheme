//
//  UITableView+SwiftyTheme.swift
//  SwiftyTheme
//
//  Created by 刘军 on 2020/5/5.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation
import UIKit


extension UITableView {
    fileprivate struct UITableViewKeys {
        static var separatorColor_key = "com.yinhe.swiftyTheme.UITableView.separatorColor"
        static var sectionIndexColor_key = "com.yinhe.swiftyTheme.UITableView.sectionIndexColor"
        static var sectionIndexBackgroundColor_key = "com.yinhe.swiftyTheme.UITableView.sectionIndexBackgroundColor"
        static var sectionIndexTrackingBackgroundColor_key = "com.yinhe.swiftyTheme.UITableView.sectionIndexTrackingBackgroundColor"
    }
}

extension UITableView {
    
    @objc public var st_separatorColor: String? {
        get {
            return objc_getAssociatedObject(self, &UITableView.UITableViewKeys.separatorColor_key) as? String
        }
        set {
            let sel = "setSeparatorColor:"
            let args: [SwiftyThemeColorKey] = [SwiftyThemeColorKey(key: newValue)]
            
            let themeObject = SwiftyThemeObject(selector: sel, args: args as [AnyObject], isEmpty: newValue == nil)
            
            SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
            
            objc_setAssociatedObject(self, &UITableView.UITableViewKeys.separatorColor_key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    @objc public var st_sectionIndexColor: String? {
        get {
            return objc_getAssociatedObject(self, &UITableView.UITableViewKeys.sectionIndexColor_key) as? String
        }
        set {
            let sel = "setSectionIndexColor:"
            let args: [SwiftyThemeColorKey] = [SwiftyThemeColorKey(key: newValue)]
            
            let themeObject = SwiftyThemeObject(selector: sel, args: args as [AnyObject], isEmpty: newValue == nil)
            
            SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
            
            objc_setAssociatedObject(self, &UITableView.UITableViewKeys.sectionIndexColor_key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    @objc public var st_sectionIndexBackgroundColor: String? {
        get {
            return objc_getAssociatedObject(self, &UITableView.UITableViewKeys.sectionIndexBackgroundColor_key) as? String
        }
        set {
            let sel = "setSectionIndexBackgroundColor:"
            let args: [SwiftyThemeColorKey] = [SwiftyThemeColorKey(key: newValue)]
            
            let themeObject = SwiftyThemeObject(selector: sel, args: args as [AnyObject], isEmpty: newValue == nil)
            
            SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
            
            objc_setAssociatedObject(self, &UITableView.UITableViewKeys.sectionIndexBackgroundColor_key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    @objc public var st_sectionIndexTrackingBackgroundColor: String? {
        get {
            return objc_getAssociatedObject(self, &UITableView.UITableViewKeys.sectionIndexTrackingBackgroundColor_key) as? String
        }
        set {
            let sel = "setSectionIndexTrackingBackgroundColor:"
            let args: [SwiftyThemeColorKey] = [SwiftyThemeColorKey(key: newValue)]
            
            let themeObject = SwiftyThemeObject(selector: sel, args: args as [AnyObject], isEmpty: newValue == nil)
            
            SwiftyTheme.shared.addProperty(with: self, themeObject: themeObject)
            
            objc_setAssociatedObject(self, &UITableView.UITableViewKeys.sectionIndexTrackingBackgroundColor_key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
}
