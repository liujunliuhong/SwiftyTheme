//
//  UISlider+SwiftyTheme.swift
//  SwiftyTheme
//
//  Created by 刘军 on 2020/5/5.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation
import UIKit

@objc public class SwiftyThemeSliderImageConfig: NSObject {
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


extension UISlider {
    @discardableResult
    @objc public func st_thumbTintColor(key: String?) -> Self {
        guard let key = key else { return self }
        self.thumbTintColor = SwiftyTheme.shared.getColor(key: SwiftyTheme.shared.getValue(key: key))
        objc_setAssociatedObject(self, &SwiftyThemeKeys.UISlider.thumbTintColor_key, key, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        SwiftyTheme.shared.hashTable.add(self)
        return self
    }
    
    @discardableResult
    @objc public func st_minimumTrackTintColor(key: String?) -> Self {
        guard let key = key else { return self }
        self.minimumTrackTintColor = SwiftyTheme.shared.getColor(key: SwiftyTheme.shared.getValue(key: key))
        objc_setAssociatedObject(self, &SwiftyThemeKeys.UISlider.minimumTrackTintColor_key, key, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        SwiftyTheme.shared.hashTable.add(self)
        return self
    }
    
    @discardableResult
    @objc public func st_maximumTrackTintColor(key: String?) -> Self {
        guard let key = key else { return self }
        self.maximumTrackTintColor = SwiftyTheme.shared.getColor(key: SwiftyTheme.shared.getValue(key: key))
        objc_setAssociatedObject(self, &SwiftyThemeKeys.UISlider.maximumTrackTintColor_key, key, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        SwiftyTheme.shared.hashTable.add(self)
        return self
    }
}

extension UISlider {
    @discardableResult
    @objc public func st_setThumbImage(configs: [SwiftyThemeSliderImageConfig]) -> Self {
        if configs.count <= 0 {
            return self
        }
        
        for (_, config) in configs.enumerated() {
            let image = UIImage.st_image(string: SwiftyTheme.shared.getValue(key: config.imageKey))
            let state = config.state
            self.setThumbImage(image, for: state)
        }
        
        objc_setAssociatedObject(self, &SwiftyThemeKeys.UISlider.thumbImage_key, configs, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        SwiftyTheme.shared.hashTable.add(self)
        return self
    }
    
    @discardableResult
    @objc public func st_setMinimumTrackImage(configs: [SwiftyThemeSliderImageConfig]) -> Self {
        if configs.count <= 0 {
            return self
        }
        
        for (_, config) in configs.enumerated() {
            let image = UIImage.st_image(string: SwiftyTheme.shared.getValue(key: config.imageKey))
            let state = config.state
            self.setMinimumTrackImage(image, for: state)
        }
        
        objc_setAssociatedObject(self, &SwiftyThemeKeys.UISlider.minimumTrackImage_key, configs, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        SwiftyTheme.shared.hashTable.add(self)
        return self
    }
    
    @discardableResult
    @objc public func st_setMaximumTrackImage(configs: [SwiftyThemeSliderImageConfig]) -> Self {
        if configs.count <= 0 {
            return self
        }
        
        for (_, config) in configs.enumerated() {
            let image = UIImage.st_image(string: SwiftyTheme.shared.getValue(key: config.imageKey))
            let state = config.state
            self.setMaximumTrackImage(image, for: state)
        }
        
        objc_setAssociatedObject(self, &SwiftyThemeKeys.UISlider.maximumTrackImage_key, configs, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        SwiftyTheme.shared.hashTable.add(self)
        return self
    }
}


