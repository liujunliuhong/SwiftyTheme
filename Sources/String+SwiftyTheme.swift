//
//  String+SwiftyTheme.swift
//  SwiftyTheme
//
//  Created by apple on 2020/5/6.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    /// "255,255,255"   "255,255,255,1"
    internal func st_rgbColor() -> UIColor? {
        var color: UIColor? = nil
        if self.contains(",") {
            var alpha: CGFloat = 1.0
            var red: CGFloat = 0.0
            var green: CGFloat = 0.0
            var blue: CGFloat = 0.0
            
            let splits = self.split(separator: ",")
            let colorStrings = splits.compactMap{ "\($0)" }
            
            if colorStrings.count == 3 {
                red = CGFloat(Int(colorStrings[0]) ?? 0) / 255.0
                green = CGFloat(Int(colorStrings[1]) ?? 0) / 255.0
                blue = CGFloat(Int(colorStrings[2]) ?? 0) / 255.0
                color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
            } else if colorStrings.count == 4 {
                red = CGFloat(Int(colorStrings[0]) ?? 0) / 255.0
                green = CGFloat(Int(colorStrings[1]) ?? 0) / 255.0
                blue = CGFloat(Int(colorStrings[2]) ?? 0) / 255.0
                alpha = CGFloat(Double(colorStrings[3]) ?? 1.0) // default 1.0
                color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
            }
        }
        return color
    }
}
