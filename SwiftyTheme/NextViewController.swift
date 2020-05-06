//
//  NextViewController.swift
//  SwiftyTheme
//
//  Created by 刘军 on 2020/5/5.
//  Copyright © 2020 yinhe. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    deinit {
        print("\(NSStringFromClass(self.classForCoder)) deinit")
    }
    
    private lazy var textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.textAlignment = .center
        textLabel.text = "UILabel"
        textLabel.font = UIFont.boldSystemFont(ofSize: 20)
        return textLabel
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Button", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "切换", style: .plain, target: self, action: #selector(changeTheme))
        
        self.textLabel.center = CGPoint(x: self.view.center.x, y: UIApplication.shared.statusBarFrame.height + 44.0 + 100)
        self.textLabel.bounds = CGRect(x: 0, y: 0, width: 200, height: 100)
        self.textLabel.st_textColor(key: "label_textColor")
//        self.textLabel.st_backgroundColor(key: "label_backgroundColor")
        self.textLabel.st_themeChangeClosure = {
            print("11111")
        }
        self.view.addSubview(self.textLabel)
        
        
        
        self.button.center = CGPoint(x: self.view.center.x, y: self.textLabel.center.y + 150)
        self.button.bounds = CGRect(x: 0, y: 0, width: 100, height: 45)
        
        let config1 = SwiftyThemeButtonTitleColorConfig(colorKey: "button_title_color", state: .normal)
        let config2 = SwiftyThemeButtonTitleColorConfig(colorKey: "button_title_highlighted_color", state: .highlighted)
        self.button.st_setTitleColor(configs: [config1, config2])
        
        self.view.addSubview(self.button)
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
}

extension NextViewController {
    @objc func changeTheme() {
        if SwiftyTheme.shared.currentThemeTag == "dark" {
            SwiftyTheme.shared.switchToTheme(tag: "white")
        } else {
            SwiftyTheme.shared.switchToTheme(tag: "dark")
        }
    }
}
