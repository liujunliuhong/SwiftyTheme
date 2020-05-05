//
//  CAShapeLayer+SwiftyTheme.swift
//  SwiftyTheme
//
//  Created by 刘军 on 2020/5/5.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation
import UIKit

extension CAShapeLayer {
    @discardableResult
    @objc public func st_fillColor(key: String?) -> Self {
        guard let key = key else { return self }
        self.fillColor = SwiftyTheme.shared.getColor(key: SwiftyTheme.shared.getValue(key: key))?.cgColor
        objc_setAssociatedObject(self, &SwiftyThemeKeys.CAShapeLayer.fillColor_key, key, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        SwiftyTheme.shared.hashTable.add(self)
        return self
    }
    
    @discardableResult
    @objc public func st_strokeColor(key: String?) -> Self {
        guard let key = key else { return self }
        self.strokeColor = SwiftyTheme.shared.getColor(key: SwiftyTheme.shared.getValue(key: key))?.cgColor
        objc_setAssociatedObject(self, &SwiftyThemeKeys.CAShapeLayer.strokeColor_key, key, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        SwiftyTheme.shared.hashTable.add(self)
        return self
    }
}
