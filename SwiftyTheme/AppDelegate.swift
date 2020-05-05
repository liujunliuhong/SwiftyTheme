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

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        
        let darkModePath = Bundle.main.path(forResource: "dark_mode.txt", ofType: nil)
        let whiteModePath = Bundle.main.path(forResource: "white_mode.txt", ofType: nil)
        
        SwiftyTheme.shared.addThemeConfiguration(bundlePath: darkModePath, sandBoxRelativePath: nil, themeTag: "dark")
        SwiftyTheme.shared.addThemeConfiguration(bundlePath: whiteModePath, sandBoxRelativePath: nil, themeTag: "white")
        
        SwiftyTheme.shared.switchToTheme(tag: "white")
        
        let vc = ViewController()
        let navi = UINavigationController(rootViewController: vc)
        self.window?.rootViewController = navi
        
        
        
        
        return true
    }
}

