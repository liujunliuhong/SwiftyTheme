//
//  UIButton+SwiftyTheme.swift
//  SwiftyTheme
//
//  Created by 刘军 on 2020/5/5.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation
import UIKit

@objc public class SwiftyThemeButtonTitleColorConfig: NSObject {
    @objc public var colorKey: String?
    @objc public var state: UIControl.State = .normal
    @objc public override init() {
        super.init()
    }
    
    @objc public init(colorKey: String?, state: UIControl.State) {
        self.colorKey = colorKey
        super.init()
        self.state = state
    }
}

@objc public class SwiftyThemeButtonImageConfig: NSObject {
    @objc public var imageKey: String?
    @objc public var state: UIControl.State = .normal
    @objc public override init() {
        super.init()
    }
    
    @objc public init(imageKey: String?, state: UIControl.State) {
        self.imageKey = imageKey
        super.init()
        self.state = state
    }
}

extension UIButton {
    @discardableResult
    @objc public func st_setTitleColor(configs: [SwiftyThemeButtonTitleColorConfig]) -> Self {
        if configs.count <= 0 {
            return self
        }
        
        for (_, config) in configs.enumerated() {
            let color = SwiftyTheme.shared.getColor(key: SwiftyTheme.shared.getValue(key: config.colorKey))
            let state = config.state
            self.setTitleColor(color, for: state)
        }
        
        objc_setAssociatedObject(self, &SwiftyThemeKeys.UIButton.titleColor_key, configs, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        SwiftyTheme.shared.hashTable.add(self)
        return self
    }
}


extension UIButton {
    @discardableResult
    @objc public func st_setImage(configs: [SwiftyThemeButtonImageConfig]) -> Self {
        if configs.count <= 0 {
            return self
        }
        
        for (_, config) in configs.enumerated() {
            let image = UIImage.st_image(string: SwiftyTheme.shared.getValue(key: config.imageKey))
            let state = config.state
            self.setImage(image, for: state)
        }
        
        objc_setAssociatedObject(self, &SwiftyThemeKeys.UIButton.image_key, configs, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        SwiftyTheme.shared.hashTable.add(self)
        return self
    }
    
    
    @discardableResult
    @objc public func st_setBackgroundImage(configs: [SwiftyThemeButtonImageConfig]) -> Self {
        if configs.count <= 0 {
            return self
        }
        
        for (_, config) in configs.enumerated() {
            let image = UIImage.st_image(string: SwiftyTheme.shared.getValue(key: config.imageKey))
            let state = config.state
            self.setBackgroundImage(image, for: state)
        }
        
        objc_setAssociatedObject(self, &SwiftyThemeKeys.UIButton.backgroundImage_key, configs, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        SwiftyTheme.shared.hashTable.add(self)
        return self
    }
}


