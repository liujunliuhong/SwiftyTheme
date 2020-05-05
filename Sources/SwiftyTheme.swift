//
//  SwiftyTheme.swift
//  SwiftyTheme
//
//  Created by apple on 2020/4/29.
//  Copyright © 2020 yinhe. All rights reserved.
//

import Foundation
import UIKit

fileprivate let SwifyThemeCurrentTag: String = "SwifyThemeCurrentTag"


internal struct SwiftyThemeKeys {
    struct Closure {
        static var themeChangeClosure_key = "com.yinhe.swiftyTheme.Closure.themeChangeClosure"
    }
    
    struct UIView {
        static var backgroundColor_key = "com.yinhe.swiftyTheme.UIView.backgroundColor"
    }
    
    struct UILabel {
        static var textColor_key = "com.yinhe.swiftyTheme.UILabel.textColor"
    }
    
    struct UIButton {
        static var titleColor_key = "com.yinhe.swiftyTheme.UIButton.titleColor"
    }
    
    struct UISwitch {
        static var onTintColor_key = "com.yinhe.swiftyTheme.UISwitch.onTintColor"
        static var thumbTintColor_key = "com.yinhe.swiftyTheme.UISwitch.thumbTintColor"
    }
    
    struct CALayer {
        static var backgroundColor_key = "com.yinhe.swiftyTheme.CALayer.backgroundColor"
        static var borderColor_key = "com.yinhe.swiftyTheme.CALayer.borderColor"
        static var shadowColor_key = "com.yinhe.swiftyTheme.CALayer.shadowColor"
    }
    
    struct CAShapeLayer {
        static var fillColor_key = "com.yinhe.swiftyTheme.CAShapeLayer.fillColor"
        static var strokeColor_key = "com.yinhe.swiftyTheme.CAShapeLayer.strokeColor"
    }
    
    struct UITableView {
        static var separatorColor_key = "com.yinhe.swiftyTheme.UITableView.separatorColor"
        static var sectionIndexColor_key = "com.yinhe.swiftyTheme.UITableView.sectionIndexColor"
        static var sectionIndexBackgroundColor_key = "com.yinhe.swiftyTheme.UITableView.sectionIndexBackgroundColor"
        static var sectionIndexTrackingBackgroundColor_key = "com.yinhe.swiftyTheme.UITableView.sectionIndexTrackingBackgroundColor"
    }
    
    struct UIProgressView {
        static var progressTintColor_key = "com.yinhe.swiftyTheme.UIProgressView.progressTintColor"
        static var trackTintColor_key = "com.yinhe.swiftyTheme.UIProgressView.trackTintColor"
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
    
    /// current theme tag
    @objc private(set) public var currentThemeTag: String {
        set {
            UserDefaults.standard.set(newValue, forKey: SwifyThemeCurrentTag)
            UserDefaults.standard.synchronize()
        }
        get {
            let value = UserDefaults.standard.object(forKey: SwifyThemeCurrentTag) as? String
            return value ?? ""
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
    @objc private func updateTheme() {
        for (_, object) in self.hashTable.allObjects.enumerated() {
            if let view = object as? UIView {
                self.updateUIViewTheme(view: view)
            }
            if let label = object as? UILabel {
                self.updateUILabelTheme(label: label)
            }
            if let button = object as? UIButton {
                self.updateUIButtonTheme(button: button)
            }
            if let uiswitch = object as? UISwitch {
                self.updateUISwitchTheme(uiswitch: uiswitch)
            }
            if let shapeLayer = object as? CAShapeLayer {
                self.updateCAShapeLayerTheme(shapeLayer: shapeLayer)
            }
            if let layer = object as? CALayer {
                self.updateCALayerTheme(layer: layer)
            }
            self.updateNSObjectTheme(object: object)
        }
    }
    
    private func updateNSObjectTheme(object: NSObject) {
        do {
            let closure = objc_getAssociatedObject(object, &SwiftyThemeKeys.Closure.themeChangeClosure_key) as? SwiftyThemeChangeClosure
            closure?()
        }
    }
    
    private func updateUIViewTheme(view: UIView) {
        do {
            // backgroundColor
            if let key = objc_getAssociatedObject(view, &SwiftyThemeKeys.UIView.backgroundColor_key) as? String {
                let value = SwiftyTheme.shared.getValue(key: key)
                view.backgroundColor = SwiftyTheme.shared.getColor(key: value)
            }
        }
        
        do {
            
        }
    }
    private func updateUILabelTheme(label: UILabel) {
        do {
            // textColor
            if let key = objc_getAssociatedObject(label, &SwiftyThemeKeys.UILabel.textColor_key) as? String {
                let value = SwiftyTheme.shared.getValue(key: key)
                label.textColor = SwiftyTheme.shared.getColor(key: value)
            }
        }
        do {
            
        }
    }
    
    private func updateUISwitchTheme(uiswitch: UISwitch) {
        do {
            // onTintColor
            if let key = objc_getAssociatedObject(uiswitch, &SwiftyThemeKeys.UISwitch.onTintColor_key) as? String {
                let value = SwiftyTheme.shared.getValue(key: key)
                uiswitch.onTintColor = SwiftyTheme.shared.getColor(key: value)
            }
        }
        do {
            // thumbTintColor
            if let key = objc_getAssociatedObject(uiswitch, &SwiftyThemeKeys.UISwitch.thumbTintColor_key) as? String {
                let value = SwiftyTheme.shared.getValue(key: key)
                uiswitch.thumbTintColor = SwiftyTheme.shared.getColor(key: value)
            }
        }
    }
    
    private func updateUIButtonTheme(button: UIButton) {
        do {
            // titleColor
            if let configs = objc_getAssociatedObject(button, &SwiftyThemeKeys.UIButton.titleColor_key) as? [SwiftyThemeButtonConfig],
                configs.count > 0 {
                for (_, config) in configs.enumerated() {
                    let color = SwiftyTheme.shared.getColor(key: SwiftyTheme.shared.getValue(key: config.colorKey))
                    let state = config.state
                    button.setTitleColor(color, for: state)
                }
            }
        }
    }
    
    private func updateCALayerTheme(layer: CALayer) {
        do {
            // backgroundColor
            if let key = objc_getAssociatedObject(layer, &SwiftyThemeKeys.CALayer.backgroundColor_key) as? String {
                let value = SwiftyTheme.shared.getValue(key: key)
                layer.backgroundColor = SwiftyTheme.shared.getColor(key: value)?.cgColor
            }
        }
        do {
            // borderColor
            if let key = objc_getAssociatedObject(layer, &SwiftyThemeKeys.CALayer.borderColor_key) as? String {
                let value = SwiftyTheme.shared.getValue(key: key)
                layer.borderColor = SwiftyTheme.shared.getColor(key: value)?.cgColor
            }
        }
        do {
            // shadowColor
            if let key = objc_getAssociatedObject(layer, &SwiftyThemeKeys.CALayer.shadowColor_key) as? String {
                let value = SwiftyTheme.shared.getValue(key: key)
                layer.shadowColor = SwiftyTheme.shared.getColor(key: value)?.cgColor
            }
        }
    }
    
    private func updateCAShapeLayerTheme(shapeLayer: CAShapeLayer) {
        do {
            // backgroundColor
            if let key = objc_getAssociatedObject(shapeLayer, &SwiftyThemeKeys.CAShapeLayer.fillColor_key) as? String {
                let value = SwiftyTheme.shared.getValue(key: key)
                shapeLayer.fillColor = SwiftyTheme.shared.getColor(key: value)?.cgColor
            }
        }
        do {
            // borderColor
            if let key = objc_getAssociatedObject(shapeLayer, &SwiftyThemeKeys.CAShapeLayer.strokeColor_key) as? String {
                let value = SwiftyTheme.shared.getValue(key: key)
                shapeLayer.strokeColor = SwiftyTheme.shared.getColor(key: value)?.cgColor
            }
        }
    }
    private func updateUITableViewTheme(tableView: UITableView) {
        do {
            // separatorColor
            if let key = objc_getAssociatedObject(tableView, &SwiftyThemeKeys.UITableView.separatorColor_key) as? String {
                let value = SwiftyTheme.shared.getValue(key: key)
                tableView.separatorColor = SwiftyTheme.shared.getColor(key: value)
            }
        }
        do {
            // sectionIndexColor
            if let key = objc_getAssociatedObject(tableView, &SwiftyThemeKeys.UITableView.sectionIndexColor_key) as? String {
                let value = SwiftyTheme.shared.getValue(key: key)
                tableView.sectionIndexColor = SwiftyTheme.shared.getColor(key: value)
            }
        }
        do {
            // sectionIndexBackgroundColor
            if let key = objc_getAssociatedObject(tableView, &SwiftyThemeKeys.UITableView.sectionIndexBackgroundColor_key) as? String {
                let value = SwiftyTheme.shared.getValue(key: key)
                tableView.sectionIndexBackgroundColor = SwiftyTheme.shared.getColor(key: value)
            }
        }
        do {
            // sectionIndexTrackingBackgroundColor
            if let key = objc_getAssociatedObject(tableView, &SwiftyThemeKeys.UITableView.sectionIndexTrackingBackgroundColor_key) as? String {
                let value = SwiftyTheme.shared.getValue(key: key)
                tableView.sectionIndexTrackingBackgroundColor = SwiftyTheme.shared.getColor(key: value)
            }
        }
    }
}

extension SwiftyTheme {
    @objc public func addThemeConfiguration(bundlePath: String?, sandBoxRelativePath: String?, themeTag: String) {
        
        if let bundlePath = bundlePath {
            SwiftyTheme.shared.tagInfo[themeTag] = bundlePath
        }
        
        if let documentpatch = SwiftyTheme.shared.documentpatch,
            let sandBoxRelativePath = sandBoxRelativePath {
            let fullPath = documentpatch + "/" + sandBoxRelativePath
            SwiftyTheme.shared.tagInfo[themeTag] = fullPath
        }
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
        }
    }
    
    
}

extension SwiftyTheme {
    
    /// get value with key
    /// - Parameter key: key
    @objc public func getValue(key: String?) -> String? {
        var value: String? = nil
        guard let key = key else {
            return value
        }
        value = SwiftyTheme.shared.currentThemeInfo[key]
        if value == nil {
            if let themePath = SwiftyTheme.shared.tagInfo[SwiftyTheme.shared.currentThemeTag],
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
