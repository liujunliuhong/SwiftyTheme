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
        textLabel.font = UIFont.boldSystemFont(ofSize: 20)
        return textLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(changeTheme))
        
        self.textLabel.center = self.view.center
        self.textLabel.bounds = CGRect(x: 0, y: 0, width: 200, height: 100)
        self.textLabel.text = "哈哈哈哈"
        self.view.addSubview(self.textLabel)
        
        self.textLabel.st_textColor(key: "label_textColor")
        self.textLabel.st_backgroundColor(key: "label_backgroundColor")
        self.textLabel.st_themeChangeClosure = {
            print("11111")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            print("\(SwiftyTheme.shared.hashTable)")
        }
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
