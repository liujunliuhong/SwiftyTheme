//
//  ViewController.swift
//  SwiftyTheme
//
//  Created by apple on 2020/4/29.
//  Copyright © 2020 yinhe. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    lazy var uiSwitch: UISwitch = {
        let uiSwitch = UISwitch()
        return uiSwitch
    }()
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            print("\(SwiftyTheme.shared.hashTable)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.st_backgroundColor(key: "uiview_backgroundColor")
        
   
        self.uiSwitch.center = CGPoint(x: 50, y: UIApplication.shared.statusBarFrame.height + 44.0 + 50)
        self.uiSwitch.st_onTintColor(key: "uiswitch_onTintColor")
        self.view.addSubview(self.uiSwitch)
        
        
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = NextViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}




/*
 主题切换：
 1、颜色
 2、图片
 
 一个开关，从一个tag到另一个tag，发出主题变化的通知
 
 */
