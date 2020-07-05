//
//  AppDelegate.swift
//  SwiftyTheme
//
//  Created by apple on 2020/4/29.
//  Copyright © 2020 yinhe. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let darkModePath = Bundle.main.path(forResource: "dark_mode.txt", ofType: nil)
        let whiteModePath = Bundle.main.path(forResource: "white_mode.txt", ofType: nil)
        
        SwiftyThemeManager.sharedInstance().addThemeConfiguration(withBundlePath: darkModePath, sandBoxRelativePath: nil, themeTag: "dark")
        SwiftyThemeManager.sharedInstance().addThemeConfiguration(withBundlePath: whiteModePath, sandBoxRelativePath: nil, themeTag: "white")
        
        SwiftyThemeManager.sharedInstance().register(with: application, syncImmediately: true, animated: true)
        
        
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
           
        
        
        
        let vc = ViewController()
        let navi = UINavigationController(rootViewController: vc)
        self.window?.rootViewController = navi
        
        
        SwiftyThemeManager.sharedInstance().setThemeTag("dark", animated: true)
        
        return true
    }
}


//extension UIWindow {
//    // 亮色模式和暗黑模式切换的时候，会通知该回调
//    override open func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//        super.traitCollectionDidChange(previousTraitCollection)
//
//        print("traitCollectionDidChange")
//
//        if #available(iOS 12.0, *) {
//            if self.traitCollection.userInterfaceStyle == .dark {
//                print("traitCollectionDidChange - dark")
//                if let darkThemeTag = SwiftyTheme.shared.darkThemeTag {
//                    SwiftyTheme.shared.switchToTheme(tag: darkThemeTag)
//                } else {
//                    SwiftyTheme.shared.switchToTheme(tag: SwiftyTheme.shared.defaultThemeTag)
//                }
//            } else {
//                print("traitCollectionDidChange - light")
//                if let lightThemeTag = SwiftyTheme.shared.lightThemeTag {
//                    SwiftyTheme.shared.switchToTheme(tag: lightThemeTag)
//                } else {
//                    SwiftyTheme.shared.switchToTheme(tag: SwiftyTheme.shared.defaultThemeTag)
//                }
//            }
//        } else {
//            print("traitCollectionDidChange - default")
//            SwiftyTheme.shared.switchToTheme(tag: SwiftyTheme.shared.defaultThemeTag)
//        }
//    }
//}


/*
 1、新用户第一次安装APP显示什么主题？是否需要对系统的light和dark模式进行判断？
 2、
 
 */
