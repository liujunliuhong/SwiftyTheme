//
//  UIView+SwiftyTheme.swift
//  SwiftyTheme
//
//  Created by 刘军 on 2020/5/5.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    @discardableResult
    @objc public func st_backgroundColor(key: String?) -> Self {
        guard let key = key else { return self }
        // Find the corresponding color by `key`
        self.backgroundColor = SwiftyTheme.shared.getColor(key: SwiftyTheme.shared.getValue(key: key))
        // Store `key`
        objc_setAssociatedObject(self, &SwiftyThemeKeys.UIView.backgroundColor_key, key, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        // Save object in weak table
        SwiftyTheme.shared.hashTable.add(self)
        return self
    }
    
    @discardableResult
    @objc public func st_tintColor(key: String?) -> Self {
        guard let key = key else { return self }
        self.tintColor = SwiftyTheme.shared.getColor(key: SwiftyTheme.shared.getValue(key: key))
        objc_setAssociatedObject(self, &SwiftyThemeKeys.UIView.tintColor_key, key, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        SwiftyTheme.shared.hashTable.add(self)
        return self
    }
}
