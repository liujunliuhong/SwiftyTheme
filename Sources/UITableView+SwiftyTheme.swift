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
    @discardableResult
    @objc public func st_separatorColor(key: String?) -> Self {
        guard let key = key else { return self }
        self.separatorColor = SwiftyTheme.shared.getColor(key: SwiftyTheme.shared.getValue(key: key))
        objc_setAssociatedObject(self, &SwiftyThemeKeys.UITableView.separatorColor_key, key, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        SwiftyTheme.shared.hashTable.add(self)
        return self
    }
    
    @discardableResult
    @objc public func st_sectionIndexColor(key: String?) -> Self {
        guard let key = key else { return self }
        self.sectionIndexColor = SwiftyTheme.shared.getColor(key: SwiftyTheme.shared.getValue(key: key))
        objc_setAssociatedObject(self, &SwiftyThemeKeys.UITableView.sectionIndexColor_key, key, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        SwiftyTheme.shared.hashTable.add(self)
        return self
    }
    
    @discardableResult
    @objc public func st_sectionIndexBackgroundColor(key: String?) -> Self {
        guard let key = key else { return self }
        self.sectionIndexBackgroundColor = SwiftyTheme.shared.getColor(key: SwiftyTheme.shared.getValue(key: key))
        objc_setAssociatedObject(self, &SwiftyThemeKeys.UITableView.sectionIndexBackgroundColor_key, key, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        SwiftyTheme.shared.hashTable.add(self)
        return self
    }
    
    @discardableResult
    @objc public func st_sectionIndexTrackingBackgroundColor(key: String?) -> Self {
        guard let key = key else { return self }
        self.sectionIndexTrackingBackgroundColor = SwiftyTheme.shared.getColor(key: SwiftyTheme.shared.getValue(key: key))
        objc_setAssociatedObject(self, &SwiftyThemeKeys.UITableView.sectionIndexTrackingBackgroundColor_key, key, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        SwiftyTheme.shared.hashTable.add(self)
        return self
    }
}
