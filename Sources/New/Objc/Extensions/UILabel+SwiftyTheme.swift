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
    open override func stThemeDidChange() {
        super.stThemeDidChange()
        
        guard let attributedText = attributedText else {
            return
        }
        
        var updatedAttributedText: NSMutableAttributedString?
        
        var range = NSRange(location: 0, length: 0)
        while range.location + range.length < attributedText.length {
            let index = range.location + range.length
            let attribute = withUnsafeMutablePointer(to: &range) {
                attributedText.attribute(.foregroundColor, at: index, effectiveRange: $0)
            }
            if let color = attribute as? SwiftyThemeDynamicColor {
                if updatedAttributedText == nil {
                    updatedAttributedText = NSMutableAttributedString(attributedString: attributedText)
                }
                updatedAttributedText?.setAttributes([.foregroundColor: color.copy()], range: range)
            }
        }
        if let updatedAttributedText = updatedAttributedText {
            self.attributedText = updatedAttributedText
        }
    }
}
