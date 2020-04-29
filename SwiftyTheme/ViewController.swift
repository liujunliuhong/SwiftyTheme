//
//  ViewController.swift
//  SwiftyTheme
//
//  Created by apple on 2020/4/29.
//  Copyright © 2020 yinhe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    lazy var testLabel: UILabel = {
        let testLabel = UILabel()
        return testLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        
        
//        guard let path = Bundle.main.path(forResource: "white_mode", ofType: "txt") else {
//            return
//        }
//
//
//        let dic = NSDictionary(contentsOf: URL(fileURLWithPath: path))
//
//        print("\(dic)")
//
        
        
    }


}


/*
 主题切换：
 1、颜色
 2、图片
 */
