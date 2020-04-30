//
//  SwiftyTheme.swift
//  SwiftyTheme
//
//  Created by apple on 2020/4/29.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation
import UIKit


//protocol SwiftyThemeCompatible: AnyObject { }
//
//extension SwiftyThemeCompatible {
//    var theme: SwiftyThemeWrapper<Self> {
//        get {
//            return SwiftyThemeWrapper<Self>(base: self)
//        }
//        set {
//            fatalError()
//        }
//    }
//}
//
//
//extension UIView: SwiftyThemeCompatible {
//
//}
//
//extension CALayer: SwiftyThemeCompatible {
//
//}
//
//extension UIBarItem: SwiftyThemeCompatible {
//
//}
//
//
//
//
//
//
//
//struct SwiftyThemeWrapper<Base> {
//    let base: Base
//    init(base: Base) {
//        self.base = base
//    }
//}
//




//
//
//extension SwiftyThemeWrapper where Base: UIView {
//
//}


//extension UIView {
//    public override var st_theme: SwiftyTheme {
//        return super.st_theme
//    }
//}
//
//
//extension UILabel {
//    public override var st_theme: SwiftyTheme {
//        return super.st_theme
//    }
//}





public class SwiftyTheme: NSObject {
    
    lazy var hashTable: NSHashTable<NSObject> = {
        let hashTable = NSHashTable<NSObject>(options: [NSPointerFunctions.Options.weakMemory])
        return hashTable
    }()
    
    public override init() {
        super.init()
        
        
        for (index, object) in self.hashTable.allObjects.enumerated() {

            if let view = object as? UIView {
                
            }
        }
    }
}

let ss = "st_xxx_UIView"

extension SwiftyTheme {
    func backgroundColor(key: String) -> Self {
        
        return self
    }
}




extension UIColor {
    func color(key: String) -> UIColor? {
        return nil
    }
}









extension NSObject {
    internal struct Keys {
        static let themeKey = "com.yinhe.swiftyTheme.key"
        static let isThemeKey = "com.yinhe.isSwiftyTheme.key"
    }
    
    @objc public var st_theme: SwiftyTheme {
        var theme = objc_getAssociatedObject(self, Keys.themeKey) as? SwiftyTheme
        
        if theme == nil {
            theme = SwiftyTheme()
            objc_setAssociatedObject(self, Keys.themeKey, theme!, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            theme!.isTheme = true
        }
        
        return theme!
    }
    
    internal var isTheme: Bool {
        get {
            let value = objc_getAssociatedObject(self, Keys.isThemeKey) as? NSNumber
            return value?.boolValue ?? false
        }
        set {
            objc_setAssociatedObject(self, Keys.isThemeKey, NSNumber(value: newValue), .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    
    @objc private dynamic func st_dealloc() {
        if self.isTheme {
            objc_setAssociatedObject(self, Keys.themeKey, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            objc_setAssociatedObject(self, Keys.isThemeKey, nil, .OBJC_ASSOCIATION_ASSIGN)
        }
        self.st_dealloc()
    }
    
    
    func <#name#>(<#parameters#>) -> <#return type#> {
        <#function body#>
    }
}
