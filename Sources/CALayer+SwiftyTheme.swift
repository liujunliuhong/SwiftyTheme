//
//  CALayer+SwiftyTheme.swift
//  SwiftyTheme
//
//  Created by 刘军 on 2020/5/5.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation
import UIKit

extension CALayer {
    @discardableResult
    @objc public func st_backgroundColor(key: String?) -> Self {
        guard let key = key else { return self }
        self.backgroundColor = SwiftyTheme.shared.getColor(key: SwiftyTheme.shared.getValue(key: key))?.cgColor
        objc_setAssociatedObject(self, &SwiftyThemeKeys.CALayer.backgroundColor_key, key, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        SwiftyTheme.shared.hashTable.add(self)
        return self
    }
    
    @discardableResult
    @objc public func st_borderColor(key: String?) -> Self {
        guard let key = key else { return self }
        self.borderColor = SwiftyTheme.shared.getColor(key: SwiftyTheme.shared.getValue(key: key))?.cgColor
        objc_setAssociatedObject(self, &SwiftyThemeKeys.CALayer.borderColor_key, key, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        SwiftyTheme.shared.hashTable.add(self)
        return self
    }
    
    @discardableResult
    @objc public func st_shadowColor(key: String?) -> Self {
        guard let key = key else { return self }
        self.shadowColor = SwiftyTheme.shared.getColor(key: SwiftyTheme.shared.getValue(key: key))?.cgColor
        objc_setAssociatedObject(self, &SwiftyThemeKeys.CALayer.shadowColor_key, key, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        SwiftyTheme.shared.hashTable.add(self)
        return self
    }
}

extension CALayer {
    @discardableResult
    @objc public func st_contents(key: String?) -> Self {
        guard let key = key else { return self }
        let image = UIImage.st_image(string: SwiftyTheme.shared.getValue(key: key))?.cgImage
        self.contents = image
        objc_setAssociatedObject(self, &SwiftyThemeKeys.CALayer.contents_key, key, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        SwiftyTheme.shared.hashTable.add(self)
        return self
    }
}
