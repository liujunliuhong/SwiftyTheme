//
//  SwiftyTheme.swift
//  SwiftyTheme
//
//  Created by apple on 2020/4/29.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation
import UIKit


protocol SwiftyThemeCompatible: AnyObject { }

extension SwiftyThemeCompatible {
    var theme: SwiftyThemeWrapper<Self> {
        get {
            return SwiftyThemeWrapper<Self>(base: self)
        }
        set {
            fatalError()
        }
    }
}


extension UIView: SwiftyThemeCompatible {
    
}

extension CALayer: SwiftyThemeCompatible {
    
}

extension UIBarItem: SwiftyThemeCompatible {
    
}







struct SwiftyThemeWrapper<Base> {
    let base: Base
    init(base: Base) {
        self.base = base
    }
}







extension SwiftyThemeWrapper where Base: UIView {
    
}



class SwiftyTheme: NSObject {
    
}



extension SwiftyTheme {
    func st_backgroundColor() -> Self {
        return self
    }
}







extension NSObject {
    var st_theme: SwiftyTheme {
        let theme = objc_getAssociatedObject(self, #function) as? SwiftyTheme
        
        return theme!
    }
}
