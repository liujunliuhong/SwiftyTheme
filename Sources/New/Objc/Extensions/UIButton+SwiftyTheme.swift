//
//  UIButton+SwiftyTheme.swift
//  SwiftyTheme
//
//  Created by 刘军 on 2020/5/5.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    open override func stThemeDidChange() {
        super.stThemeDidChange()
        
        [UIControl.State.normal, .highlighted, .disabled, .selected, .focused].forEach { (state) in
            if let color = self.titleColor(for: state)?.copy() as? SwiftyThemeDynamicColor {
                self.setTitleColor(color, for: state)
            }
        }
    }
}
