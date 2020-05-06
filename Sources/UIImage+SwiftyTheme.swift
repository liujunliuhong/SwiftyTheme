//
//  UIImage+SwiftyTheme.swift
//  SwiftyTheme
//
//  Created by apple on 2020/5/6.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    @objc public static func st_image(string: String?) -> UIImage? {
        guard let string = string else { return nil }
        
        var resultImage: UIImage? = nil
        
        if let color = string.st_rgbColor() {
            resultImage = UIImage.image(color: color)
            return resultImage
        }
        
        // Find pictures from the sandbox
        if let documentpatch = SwiftyTheme.shared.documentpatch {
            let fullPath = documentpatch + "/" + string
            let sandboxImage = UIImage(contentsOfFile: fullPath)
            resultImage = sandboxImage
        }
        
        // Find pictures from the project
        if resultImage == nil {
            let projectImage = UIImage(named: string)
            resultImage = projectImage
        }
        
        // Find pictures from the project
        if resultImage == nil {
            let projectBundleImagePath = Bundle.main.bundlePath + "/" + string
            let projectBundleImage = UIImage(contentsOfFile: projectBundleImagePath)
            resultImage = projectBundleImage
        }
        
        return resultImage
    }
}

extension UIImage {
    fileprivate static func image(color: UIColor, size: CGSize = CGSize(width: 1.0, height: 1.0)) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
