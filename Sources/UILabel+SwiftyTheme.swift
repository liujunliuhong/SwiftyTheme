//
//  UILabel+SwiftyTheme.swift
//  SwiftyTheme
//
//  Created by 刘军 on 2020/5/5.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation
import UIKit


extension UILabel {
    @discardableResult
    @objc public func st_textColor(key: String?) -> Self {
        guard let key = key else { return self }
        self.textColor = SwiftyTheme.shared.getColor(key: SwiftyTheme.shared.getValue(key: key))
        objc_setAssociatedObject(self, &SwiftyThemeKeys.UILabel.textColor_key, key, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        SwiftyTheme.shared.hashTable.add(self)
        return self
    }
}
