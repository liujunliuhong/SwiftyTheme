//
//  UIButton+SwiftyTheme.swift
//  SwiftyTheme
//
//  Created by 刘军 on 2020/5/5.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation
import UIKit

@objc public class SwiftyThemeButtonConfig: NSObject {
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

extension UIButton {
    @objc public func st_setTitleColor(configs: [SwiftyThemeButtonConfig]) {
        if configs.count <= 0 {
            return
        }
        
        for (_, config) in configs.enumerated() {
            let color = SwiftyTheme.shared.getColor(key: SwiftyTheme.shared.getValue(key: config.colorKey))
            let state = config.state
            self.setTitleColor(color, for: state)
        }
        
        objc_setAssociatedObject(self, &SwiftyThemeKeys.UIButton.titleColor_key, configs, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        SwiftyTheme.shared.hashTable.add(self)
    }
}
