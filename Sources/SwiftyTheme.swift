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
    struct Themes {
        static var key = "com.yinhe.swiftyTheme.Themes.key"
    }
    
    struct Closure {
        static var themeChangeClosure_key = "com.yinhe.swiftyTheme.Closure.themeChangeClosure"
    }
    
    struct UIView {
        static var backgroundColor_key = "com.yinhe.swiftyTheme.UIView.backgroundColor"
        static var tintColor_key = "com.yinhe.swiftyTheme.UIView.tintColor"
    }
    
    struct UILabel {
        static var textColor_key = "com.yinhe.swiftyTheme.UILabel.textColor"
    }
    
    struct UIButton {
        static var titleColor_key = "com.yinhe.swiftyTheme.UIButton.titleColor"
        static var image_key = "com.yinhe.swiftyTheme.UIButton.image"
        static var backgroundImage_key = "com.yinhe.swiftyTheme.UIButton.backgroundImage"
    }
    
    struct UISwitch {
        static var onTintColor_key = "com.yinhe.swiftyTheme.UISwitch.onTintColor"
        static var thumbTintColor_key = "com.yinhe.swiftyTheme.UISwitch.thumbTintColor"
    }
    
    struct CALayer {
        static var backgroundColor_key = "com.yinhe.swiftyTheme.CALayer.backgroundColor"
        static var borderColor_key = "com.yinhe.swiftyTheme.CALayer.borderColor"
        static var shadowColor_key = "com.yinhe.swiftyTheme.CALayer.shadowColor"
        static var contents_key = "com.yinhe.swiftyTheme.CALayer.contens"
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
        static var progressImage_key = "com.yinhe.swiftyTheme.UIProgressView.progressImage"
        static var trackImage_key = "com.yinhe.swiftyTheme.UIProgressView.trackImage"
    }
    
    struct UISlider {
        static var thumbTintColor_key = "com.yinhe.swiftyTheme.UISlider.thumbTintColor"
        static var minimumTrackTintColor_key = "com.yinhe.swiftyTheme.UISlider.minimumTrackTintColor"
        static var maximumTrackTintColor_key = "com.yinhe.swiftyTheme.UISlider.maximumTrackTintColor"
        static var thumbImage_key = "com.yinhe.swiftyTheme.UISlider.thumbImage"
        static var maximumTrackImage_key = "com.yinhe.swiftyTheme.UISlider.maximumTrackImage"
        static var minimumTrackImage_key = "com.yinhe.swiftyTheme.UISlider.minimumTrackImage"
    }
    
    struct UIPageControl {
        static var pageIndicatorTintColor_key = "com.yinhe.swiftyTheme.UIPageControl.pageIndicatorTintColor"
        static var currentPageIndicatorTintColor_key = "com.yinhe.swiftyTheme.UIPageControl.currentPageIndicatorTintColor"
    }
    
    struct UIImageView {
        static var image_key = "com.yinhe.swiftyTheme.UIImageView.image"
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
    @objc public func setup() {
        
    }
    
    @objc private func updateTheme() {
        for (_, object) in self.hashTable.allObjects.enumerated() {
            if let view = object as? UIView {
                self.updateUIViewTheme(view: view)
            }
            if let imageView = object as? UIImageView {
                self.updateUIImageViewTheme(imageView: imageView)
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
            if let tableView = object as? UITableView {
                self.updateUITableViewTheme(tableView: tableView)
            }
            if let progressView = object as? UIProgressView {
                self.updateUIProgressViewTheme(progressView: progressView)
            }
            if let slider = object as? UISlider {
                self.updateUISliderTheme(slider: slider)
            }
            if let pageControl = object as? UIPageControl {
                self.updateUIPageControlTheme(pageControl: pageControl)
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
            // tintColor
            if let key = objc_getAssociatedObject(view, &SwiftyThemeKeys.UIView.tintColor_key) as? String {
                let value = SwiftyTheme.shared.getValue(key: key)
                view.tintColor = SwiftyTheme.shared.getColor(key: value)
            }
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
            if let configs = objc_getAssociatedObject(button, &SwiftyThemeKeys.UIButton.titleColor_key) as? [SwiftyThemeButtonTitleColorConfig],
                configs.count > 0 {
                for (_, config) in configs.enumerated() {
                    let color = SwiftyTheme.shared.getColor(key: SwiftyTheme.shared.getValue(key: config.colorKey))
                    let state = config.state
                    button.setTitleColor(color, for: state)
                }
            }
        }
        do {
            // image
            if let configs = objc_getAssociatedObject(button, &SwiftyThemeKeys.UIButton.image_key) as? [SwiftyThemeButtonImageConfig],
                configs.count > 0 {
                for (_, config) in configs.enumerated() {
                    let image = UIImage.st_image(string: SwiftyTheme.shared.getValue(key: config.imageKey))
                    let state = config.state
                    button.setImage(image, for: state)
                }
            }
        }
        do {
            // backgroundImage
            if let configs = objc_getAssociatedObject(button, &SwiftyThemeKeys.UIButton.backgroundImage_key) as? [SwiftyThemeButtonImageConfig],
                configs.count > 0 {
                for (_, config) in configs.enumerated() {
                    let image = UIImage.st_image(string: SwiftyTheme.shared.getValue(key: config.imageKey))
                    let state = config.state
                    button.setBackgroundImage(image, for: state)
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
        do {
            // contents
            if let key = objc_getAssociatedObject(layer, &SwiftyThemeKeys.CALayer.contents_key) as? String {
                let value = SwiftyTheme.shared.getValue(key: key)
                layer.contents = UIImage.st_image(string: value)?.cgImage
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
    
    private func updateUIProgressViewTheme(progressView: UIProgressView) {
        do {
            // progressTintColor
            if let key = objc_getAssociatedObject(progressView, &SwiftyThemeKeys.UIProgressView.progressTintColor_key) as? String {
                let value = SwiftyTheme.shared.getValue(key: key)
                progressView.progressTintColor = SwiftyTheme.shared.getColor(key: value)
            }
        }
        do {
            // trackTintColor
            if let key = objc_getAssociatedObject(progressView, &SwiftyThemeKeys.UIProgressView.trackTintColor_key) as? String {
                let value = SwiftyTheme.shared.getValue(key: key)
                progressView.trackTintColor = SwiftyTheme.shared.getColor(key: value)
            }
        }
        do {
            // progressImage
            if let key = objc_getAssociatedObject(progressView, &SwiftyThemeKeys.UIProgressView.progressImage_key) as? String {
                let value = SwiftyTheme.shared.getValue(key: key)
                progressView.progressImage = UIImage.st_image(string: value)
            }
        }
        do {
            // trackImage
            if let key = objc_getAssociatedObject(progressView, &SwiftyThemeKeys.UIProgressView.trackImage_key) as? String {
                let value = SwiftyTheme.shared.getValue(key: key)
                progressView.trackImage = UIImage.st_image(string: value)
            }
        }
    }
    
    private func updateUISliderTheme(slider: UISlider) {
        do {
            // thumbTintColor
            if let key = objc_getAssociatedObject(slider, &SwiftyThemeKeys.UISlider.thumbTintColor_key) as? String {
                let value = SwiftyTheme.shared.getValue(key: key)
                slider.thumbTintColor = SwiftyTheme.shared.getColor(key: value)
            }
        }
        do {
            // minimumTrackTintColor
            if let key = objc_getAssociatedObject(slider, &SwiftyThemeKeys.UISlider.minimumTrackTintColor_key) as? String {
                let value = SwiftyTheme.shared.getValue(key: key)
                slider.minimumTrackTintColor = SwiftyTheme.shared.getColor(key: value)
            }
        }
        do {
            // maximumTrackTintColor
            if let key = objc_getAssociatedObject(slider, &SwiftyThemeKeys.UISlider.maximumTrackTintColor_key) as? String {
                let value = SwiftyTheme.shared.getValue(key: key)
                slider.maximumTrackTintColor = SwiftyTheme.shared.getColor(key: value)
            }
        }
        do {
            // thumbImage
            if let configs = objc_getAssociatedObject(slider, &SwiftyThemeKeys.UISlider.thumbImage_key) as? [SwiftyThemeSliderImageConfig],
                configs.count > 0 {
                for (_, config) in configs.enumerated() {
                    let image = UIImage.st_image(string: SwiftyTheme.shared.getValue(key: config.imageKey))
                    let state = config.state
                    slider.setThumbImage(image, for: state)
                }
            }
        }
        do {
            // minimumTrackImage
            if let configs = objc_getAssociatedObject(slider, &SwiftyThemeKeys.UISlider.minimumTrackImage_key) as? [SwiftyThemeSliderImageConfig],
                configs.count > 0 {
                for (_, config) in configs.enumerated() {
                    let image = UIImage.st_image(string: SwiftyTheme.shared.getValue(key: config.imageKey))
                    let state = config.state
                    slider.setMinimumTrackImage(image, for: state)
                }
            }
        }
        do {
            // maximumTrackImage
            if let configs = objc_getAssociatedObject(slider, &SwiftyThemeKeys.UISlider.maximumTrackImage_key) as? [SwiftyThemeSliderImageConfig],
                configs.count > 0 {
                for (_, config) in configs.enumerated() {
                    let image = UIImage.st_image(string: SwiftyTheme.shared.getValue(key: config.imageKey))
                    let state = config.state
                    slider.setMaximumTrackImage(image, for: state)
                }
            }
        }
    }
    
    private func updateUIPageControlTheme(pageControl: UIPageControl) {
        do {
            // pageIndicatorTintColor
            if let key = objc_getAssociatedObject(pageControl, &SwiftyThemeKeys.UIPageControl.pageIndicatorTintColor_key) as? String {
                let value = SwiftyTheme.shared.getValue(key: key)
                pageControl.pageIndicatorTintColor = SwiftyTheme.shared.getColor(key: value)
            }
        }
        do {
            // currentPageIndicatorTintColor
            if let key = objc_getAssociatedObject(pageControl, &SwiftyThemeKeys.UIPageControl.currentPageIndicatorTintColor_key) as? String {
                let value = SwiftyTheme.shared.getValue(key: key)
                pageControl.currentPageIndicatorTintColor = SwiftyTheme.shared.getColor(key: value)
            }
        }
    }
    
    private func updateUIImageViewTheme(imageView: UIImageView) {
        do {
            // image
            if let key = objc_getAssociatedObject(imageView, &SwiftyThemeKeys.UIImageView.image_key) as? String {
                let value = SwiftyTheme.shared.getValue(key: key)
                imageView.image = UIImage.st_image(string: value)
            }
        }
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
