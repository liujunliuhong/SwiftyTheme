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
    @discardableResult
    @objc public func st_progressTintColor(key: String?) -> Self {
        guard let key = key else { return self }
        self.progressTintColor = SwiftyTheme.shared.getColor(key: SwiftyTheme.shared.getValue(key: key))
        objc_setAssociatedObject(self, &SwiftyThemeKeys.UIProgressView.progressTintColor_key, key, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        SwiftyTheme.shared.hashTable.add(self)
        return self
    }
    
    @discardableResult
    @objc public func st_trackTintColor(key: String?) -> Self {
        guard let key = key else { return self }
        self.trackTintColor = SwiftyTheme.shared.getColor(key: SwiftyTheme.shared.getValue(key: key))
        objc_setAssociatedObject(self, &SwiftyThemeKeys.UIProgressView.trackTintColor_key, key, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        SwiftyTheme.shared.hashTable.add(self)
        return self
    }
}



extension UIProgressView {
    @discardableResult
    @objc public func st_progressImage(key: String?) -> Self {
        guard let key = key else { return self }
        self.progressImage = UIImage.st_image(string: SwiftyTheme.shared.getValue(key: key))
        objc_setAssociatedObject(self, &SwiftyThemeKeys.UIProgressView.progressImage_key, key, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        SwiftyTheme.shared.hashTable.add(self)
        return self
    }
    
    @discardableResult
    @objc public func st_trackImage(key: String?) -> Self {
        guard let key = key else { return self }
        self.trackImage = UIImage.st_image(string: SwiftyTheme.shared.getValue(key: key))
        objc_setAssociatedObject(self, &SwiftyThemeKeys.UIProgressView.trackImage_key, key, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        SwiftyTheme.shared.hashTable.add(self)
        return self
    }
}
