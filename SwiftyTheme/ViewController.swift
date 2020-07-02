//
//  ViewController.swift
//  SwiftyTheme
//
//  Created by apple on 2020/4/29.
//  Copyright © 2020 yinhe. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

//    lazy var uiSwitch: UISwitch = {
//        let uiSwitch = UISwitch()
//        return uiSwitch
//    }()
    
    lazy var testView: UIView = {
      let testView = UIView()
      return testView
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
        
//        self.view.st_backgroundColor = "uiview_backgroundColor"
        
//        self.uiSwitch.center = CGPoint(x: 50, y: UIApplication.shared.statusBarFrame.height + 44.0 + 50)
//        self.uiSwitch.st_onTintColor = "uiswitch_onTintColor"
//        self.view.addSubview(self.uiSwitch)
        
        self.testView.backgroundColor = UIColor.st_color(withKey: "")
     self.view.addSubview(self.testView)
     self.testView.frame = CGRect(x: 100, y: 350, width: 100, height: 100)
        
        
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let vc = NextViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
        
        SwiftyThemeManager.setThemeTag("", animated: true)
    }
    
}

extension ViewController {
    
}




/*
 主题切换：
 1、颜色
 2、图片
 
 一个开关，从一个tag到另一个tag，发出主题变化的通知
 */


/*
 个性主题 > 系统模式 > 默认主题
 */
