//
//  UISwitch+SwiftyTheme.swift
//  SwiftyTheme
//
//  Created by 刘军 on 2020/5/5.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation
import UIKit

extension UISwitch {
    @objc public func st_onTintColor(key: String?) {
        guard let key = key else { return }
        self.onTintColor = SwiftyTheme.shared.getColor(key: SwiftyTheme.shared.getValue(key: key))
        objc_setAssociatedObject(self, &SwiftyThemeKeys.UISwitch.onTintColor_key, key, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        SwiftyTheme.shared.hashTable.add(self)
    }
    
    @objc public func st_thumbTintColor(key: String?) {
        guard let key = key else { return }
        self.thumbTintColor = SwiftyTheme.shared.getColor(key: SwiftyTheme.shared.getValue(key: key))
        objc_setAssociatedObject(self, &SwiftyThemeKeys.UISwitch.thumbTintColor_key, key, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        SwiftyTheme.shared.hashTable.add(self)
    }
}

