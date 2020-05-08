//
//  SwiftyTheme.swift
//  SwiftyTheme
//
//  Created by apple on 2020/4/29.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation
import UIKit

internal struct SwiftyThemeKeys {
    struct Themes {
        static var key = "com.yinhe.swiftyTheme.Themes.key"
    }
    
    struct Closure {
        static var themeChangeClosure_key = "com.yinhe.swiftyTheme.Closure.themeChangeClosure"
    }
}

fileprivate extension UserDefaults {
    struct ThemeKeys {
        static var themeKey = "com.yinhe.swiftyTheme.UserDefaults.ThemeKeys.themeKey"
    }
    
    static func save(themeTag: String?) {
        guard let themeTag = themeTag else { return }
        UserDefaults.standard.set(themeTag, forKey: ThemeKeys.themeKey)
        UserDefaults.standard.synchronize()
    }
    
    static func removeThemeTag() {
        UserDefaults.standard.removeObject(forKey: ThemeKeys.themeKey)
        UserDefaults.standard.synchronize()
    }
    
    static func currentThemeTag() -> String? {
        return UserDefaults.standard.object(forKey: ThemeKeys.themeKey) as? String
    }
}



@objc public class SwiftyTheme: NSObject {
    
    /// shared
    @objc public static let shared = SwiftyTheme()
    
    /// theme change notification name
    @objc public static let SwifyThemeChangeNotification: String = "SwifyThemeChangeNotification"
    
    /// documentpatch
    @objc public let documentpatch = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
    
    /// key: themeTag       value: themePath
    @objc private(set) public var tagInfo: [String: String] = [:]
    
    /// key: key    value: value
    @objc private(set) public var currentThemeInfo: [String: String] = [:]
    
    /// default theme tag
    @objc private(set) public var defaultThemeTag: String?
    
    /// light theme tag
    @objc private(set) public var lightThemeTag: String?
    
    /// dark theme tag
    @objc private(set) public var darkThemeTag: String?
    
    
    /// current theme tag
    @objc private(set) public var currentThemeTag: String? {
        set {
            UserDefaults.save(themeTag: newValue)
        }
        get {
            return UserDefaults.currentThemeTag()
        }
    }
    
    
    internal lazy var hashTable: NSHashTable<NSObject> = {
        let hashTable = NSHashTable<NSObject>(options: [NSPointerFunctions.Options.weakMemory])
        return hashTable
    }()
    
    
    private override init() {
        super.init()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateTheme), name: NSNotification.Name(SwiftyTheme.SwifyThemeChangeNotification), object: nil)
    }
}

extension SwiftyTheme {
    @objc public func setup(defaultThemeTag: String?, lightThemeTag: String?, darkThemeTag: String?) {
        self.defaultThemeTag = defaultThemeTag
        self.lightThemeTag = lightThemeTag
        self.darkThemeTag = darkThemeTag
    }
    
    
    @objc private func updateTheme() {
        for (_, object) in self.hashTable.allObjects.enumerated() {
            
            let themeObjects = object.st_themes
            
            // perfom
            for (_, themeObject) in themeObjects.enumerated() {
                let newThemeObject = SwiftyTheme.shared.convertThemeObject(themeObject: themeObject)
                object.st_perfom(withSelectorString: newThemeObject.selector, args: newThemeObject.args as [Any])
            }
            
            // change closure
            object.st_themeChangeClosure?()
        }
    }
  
    
    internal func addProperty(with object: NSObject, themeObject: SwiftyThemeObject) {
        let themeObject = themeObject
        var objects = object.st_themes
        
        for (i, o) in objects.enumerated() {
            if o == themeObject {
                objects.remove(at: i) // remove
                break
            }
        }
        
        //
        if !themeObject.isEmpty {
            objects.append(themeObject)
            object.st_themes = objects
            SwiftyTheme.shared.hashTable.add(object)
            
            // perfom
            let newThemeObject = SwiftyTheme.shared.convertThemeObject(themeObject: themeObject)
            object.st_perfom(withSelectorString: newThemeObject.selector, args: newThemeObject.args as [Any])
        } else {
            object.st_themes = objects
        }
    }
    
    private func convertThemeObject(themeObject: SwiftyThemeObject) -> SwiftyThemeObject {
        var themeObject = themeObject
        
        var args = themeObject.args
        
        for (index, o) in args.enumerated() {
            if let colorKey = o as? SwiftyThemeColorKey {
                let color = SwiftyTheme.shared.getColor(key: SwiftyTheme.shared.getValue(key: colorKey.key))
                args[index] = color
            } else if let imageKey = o as? SwiftyThemeImageKey {
                let image = UIImage.st_image(string: SwiftyTheme.shared.getValue(key: imageKey.key))
                args[index] = image
            }
        }
        themeObject.args = args
        return themeObject
    }
}

extension SwiftyTheme {
    @objc public func addThemeConfiguration(bundlePath: String?, sandBoxRelativePath: String?, themeTag: String) {
        
        if let bundlePath = bundlePath {
            SwiftyTheme.shared.tagInfo[themeTag] = bundlePath
            return
        }
        
        if let documentpatch = SwiftyTheme.shared.documentpatch,
            let sandBoxRelativePath = sandBoxRelativePath {
            let fullPath = documentpatch + "/" + sandBoxRelativePath
            SwiftyTheme.shared.tagInfo[themeTag] = fullPath
            return
        }
        print("path error.")
    }
    
    @objc public func switchToTheme(tag: String?) {
        guard let tag = tag else {
            print("tag is empty.")
            return
        }
        
        guard SwiftyTheme.shared.tagInfo.keys.contains(tag) else {
            print("tag does not exist.")
            return
        }
        
        let themePath = SwiftyTheme.shared.tagInfo[tag]
        /*
         if let jsonString = try? String(contentsOfFile: themePath!, encoding: .utf8),
         let jsonData = jsonString.data(using: .utf8),
         let themeInfo = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [String: String]{
         let dic = NSDictionary(contentsOf: URL(fileURLWithPath: themePath!)) as! [String: String]
         SwiftyTheme.shared.currentThemeInfo = themeInfo
         SwiftyTheme.shared.currentThemeTag = tag
         
         NotificationCenter.default.post(name: NSNotification.Name(SwiftyTheme.SwifyThemeChangeNotification), object: nil)
         }
         */
        if let themeInfo = NSDictionary(contentsOf: URL(fileURLWithPath: themePath!)) as? [String: String] {
            SwiftyTheme.shared.currentThemeInfo = themeInfo
            SwiftyTheme.shared.currentThemeTag = tag
            
            NotificationCenter.default.post(name: NSNotification.Name(SwiftyTheme.SwifyThemeChangeNotification), object: nil)
            
            UserDefaults.save(themeTag: tag)
        }
    }
}

extension SwiftyTheme: UITraitEnvironment {
    public var traitCollection: UITraitCollection {
        return UITraitCollection()
    }
    
    public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
    }
}

extension SwiftyTheme {
    
    /// get value with key
    /// - Parameter key: key
    @objc public func getValue(key: String?) -> String? {
        guard let currentThemeTag = SwiftyTheme.shared.currentThemeTag else { return nil }
        var value: String? = nil
        guard let key = key else {
            return value
        }
        value = SwiftyTheme.shared.currentThemeInfo[key]
        if value == nil {
            if let themePath = SwiftyTheme.shared.tagInfo[currentThemeTag],
                let themeInfo = NSDictionary(contentsOf: URL(fileURLWithPath: themePath)) as? [String: String] {
                value = themeInfo[key]
            }
            /*
             if let themePath = SwiftyTheme.shared.tagInfo[SwiftyTheme.shared.currentThemeTag],
             let jsonString = try? String(contentsOfFile: themePath, encoding: .utf8),
             let jsonData = jsonString.data(using: .utf8),
             let themeInfo = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [String: String]{
             value = themeInfo[key]
             }
             */
        }
        return value
    }
    
    /// get color with key
    /// - Parameter key: key
    @objc public func getColor(key: String?) -> UIColor? {
        guard let key = key else { return nil }
        return UIColor.st_color(string: key)
    }
}
