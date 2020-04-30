//
//  UIColor+SwiftyTheme.swift
//  SwiftyTheme
//
//  Created by apple on 2020/4/29.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation
import UIKit


extension UIColor {
    
    /// hex color -> UIColor
    /// - Parameter hex: hex(0xFFFFFF，0xffffff)，not case sensitive
    @objc public static func st_hexColor(hex: Int) -> UIColor? {
        return UIColor.st_color(string: "\(hex)")
    }
    
    
    /// string -> UIColor
    /// - Parameter string: string(#ffffff，#FFFFFF, #fff, "255, 255, 255")，not case sensitive
    @objc public static func st_color(string: String?) -> UIColor? {
        guard var string = string else { return nil }
        
        string = string.uppercased()
        string = string.replacingOccurrences(of: "#", with: "")
        string = string.replacingOccurrences(of: "0X", with: "")
        string = string.replacingOccurrences(of: " ", with: "")
        
        var alpha: CGFloat = 1.0
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        
        print("color string: \(string)")
        
        if string.contains(",") {
            // "255, 255, 255"
            // "255, 255, 255, 1.0"
            // "255, 255, 255, 1"
            let splits = string.split(separator: ",")
            let colorStrings = splits.compactMap{ "\($0)" }
            if colorStrings.count == 3 {
                red = CGFloat(Int(colorStrings[0]) ?? 0) / 255.0
                green = CGFloat(Int(colorStrings[1]) ?? 0) / 255.0
                blue = CGFloat(Int(colorStrings[2]) ?? 0) / 255.0
            } else if colorStrings.count == 4 {
                red = CGFloat(Int(colorStrings[0]) ?? 0) / 255.0
                green = CGFloat(Int(colorStrings[1]) ?? 0) / 255.0
                blue = CGFloat(Int(colorStrings[2]) ?? 0) / 255.0
                alpha = CGFloat(Double(colorStrings[3]) ?? 1.0) // default 1.0
            }
        } else {
            // hex
            switch string.count {
            case 3: // RGB    #fff
                alpha = 1.0
                red = UIColor.color(string: string, start: 0, length: 1)
                green = UIColor.color(string: string, start: 1, length: 1)
                blue = UIColor.color(string: string, start: 2, length: 1)
            case 4: // ARGB   #ffff
                alpha = UIColor.color(string: string, start: 0, length: 1)
                red = UIColor.color(string: string, start: 1, length: 1)
                green = UIColor.color(string: string, start: 2, length: 1)
                blue = UIColor.color(string: string, start: 3, length: 1)
            case 6: // RRGGBB  #ffffff
                alpha = 1.0
                red = UIColor.color(string: string, start: 0, length: 2)
                green = UIColor.color(string: string, start: 2, length: 2)
                blue = UIColor.color(string: string, start: 3, length: 2)
            case 8: // AARRGGBB  #ffffffff
                alpha = UIColor.color(string: string, start: 0, length: 2)
                red = UIColor.color(string: string, start: 2, length: 2)
                green = UIColor.color(string: string, start: 4, length: 2)
                blue = UIColor.color(string: string, start: 6, length: 2)
            default:
                break
            }
        }
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}

extension UIColor {
    internal static func color(string: String, start: Int, length: Int) -> CGFloat {
        if start > string.count {
            return 0.0
        }
        if start + length > string.count {
            return 0.0
        }
        
        let string = string
        
        let startIndex = string.index(string.startIndex, offsetBy: start)
        let endIndex = string.index(startIndex, offsetBy: length)
        
        var subString = String(string[startIndex..<endIndex])
        
        if subString.count < 1 || subString.count > 2 {
            return .zero
        }
        
        if subString.count == 1 {
            subString = subString + subString
        }
        
        var value: UInt32 = 0
        
        let scanner = Scanner(string: subString)
        scanner.scanHexInt32(&value)
     
        return CGFloat(value) / 255.0
    }
}