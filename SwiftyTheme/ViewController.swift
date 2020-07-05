//
//  ViewController.swift
//  SwiftyTheme
//
//  Created by apple on 2020/4/29.
//  Copyright © 2020 yinhe. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    lazy var testView: UIView = {
      let testView = UIView()
      return testView
    }()
    
    lazy var testLabel: UILabel = {
      let testLabel = UILabel()
        testLabel.textAlignment = .center
      return testLabel
    }()
    
    lazy var testButton: UIButton = {
        let testButton = UIButton(type: .custom)
        return testButton
    }()
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            print("\(SwiftyTheme.shared.hashTable)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextAction))
        
        self.view.addSubview(self.testView)
        //self.view.addSubview(self.testLabel)
        //self.view.addSubview(self.testButton)
        
        self.testView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.topMargin).offset(50)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.height.equalTo(100)
        }
        
//        self.testLabel.snp.makeConstraints { (make) in
//            make.top.equalTo(self.testView.snp.bottom).offset(30)
//            make.left.equalToSuperview().offset(40)
//            make.right.equalToSuperview().offset(-40)
//            make.height.equalTo(50)
//        }
        
//        self.testButton.snp.makeConstraints { (make) in
//            make.top.equalTo(self.testLabel.snp.bottom).offset(30)
//            make.left.equalToSuperview().offset(40)
//            make.right.equalToSuperview().offset(-40)
//            make.height.equalTo(50)
//        }
        
        self.testView.backgroundColor = UIColor.st_color(withKey: "uiview_backgroundColor")
        
//        self.testLabel.backgroundColor = UIColor.st_color(withKey: "label_backgroundColor")
//        self.testLabel.textColor = UIColor.st_color(withKey: "label_textColor")
        
//        self.testButton.backgroundColor = UIColor.st_color(withKey: "button_bg_color")
//        self.testButton.setTitleColor(UIColor.st_color(withKey: "button_title_color"), for: .normal)
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

        if SwiftyThemeManager.sharedInstance().currentThemeTag == "dark" {
            SwiftyThemeManager.sharedInstance().setThemeTag("white", animated: true)
        } else {
            SwiftyThemeManager.sharedInstance().setThemeTag("dark", animated: true)
        }
    }
    
}

extension ViewController {
    @objc func nextAction() {
        
    }
}
