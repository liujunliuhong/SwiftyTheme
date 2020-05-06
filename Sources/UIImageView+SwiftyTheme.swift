//
//  UIImageView+SwiftyTheme.swift
//  SwiftyTheme
//
//  Created by apple on 2020/5/6.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    @discardableResult
    @objc public func st_image(key: String?) -> Self {
        guard let key = key else { return self }
        self.image = UIImage.st_image(string: SwiftyTheme.shared.getValue(key: key))
        objc_setAssociatedObject(self, &SwiftyThemeKeys.UIImageView.image_key, key, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        SwiftyTheme.shared.hashTable.add(self)
        return self
    }
}
