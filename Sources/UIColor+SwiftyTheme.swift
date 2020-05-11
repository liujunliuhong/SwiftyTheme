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
    /// - Parameters:
    ///   - hex: hex(0xFFFFFF，0xffffff)，not case sensitive
    ///   - alpha: alpha
    @objc public static func st_hexColor(hex: Int, alpha: CGFloat = 1.0) -> UIColor? {
        let red = CGFloat((Double((hex >> 16) & 0xFF)) / 255.0)
        let green = CGFloat((Double((hex >> 8) & 0xFF)) / 255.0)
        let blue = CGFloat((Double(hex & 0xFF)) / 255.0)
        return UIColor.init(red: red,
                            green: green,
                            blue: blue,
                            alpha: alpha)
    }
    
    
    /// string -> UIColor
    /// - Parameter string: string(#ffffff，#FFFFFF, #fff, "255, 255, 255")，not case sensitive
    @objc public static func st_color(string: String?) -> UIColor? {
        guard var string = string else { return nil }
        
        string = string.uppercased()
        string = string.replacingOccurrences(of: "#", with: "")
        string = string.replacingOccurrences(of: "0X", with: "")
        string = string.replacingOccurrences(of: " ", with: "")
        
        print("color string: \(string)")
        
        // "255, 255, 255"
        if let rgbColor = string.st_rgbColor() {
            return rgbColor
        }
        
        
        var hexColor: UIColor? = nil
        // hex
        switch string.count {
        case 3: // RGB    #fff
            let alpha: CGFloat = 1.0
            let red = UIColor.color(string: string, start: 0, length: 1)
            let green = UIColor.color(string: string, start: 1, length: 1)
            let blue = UIColor.color(string: string, start: 2, length: 1)
            hexColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        case 4: // ARGB   #ffff
            let alpha = UIColor.color(string: string, start: 0, length: 1)
            let red = UIColor.color(string: string, start: 1, length: 1)
            let green = UIColor.color(string: string, start: 2, length: 1)
            let blue = UIColor.color(string: string, start: 3, length: 1)
            hexColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        case 6: // RRGGBB  #ffffff
            let alpha: CGFloat = 1.0
            let red = UIColor.color(string: string, start: 0, length: 2)
            let green = UIColor.color(string: string, start: 2, length: 2)
            let blue = UIColor.color(string: string, start: 4, length: 2)
            hexColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        case 8: // AARRGGBB  #ffffffff
            let alpha = UIColor.color(string: string, start: 0, length: 2)
            let red = UIColor.color(string: string, start: 2, length: 2)
            let green = UIColor.color(string: string, start: 4, length: 2)
            let blue = UIColor.color(string: string, start: 6, length: 2)
            hexColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        default:
            break
        }
        
        return hexColor
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
