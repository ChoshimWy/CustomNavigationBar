//
//  AppDelegate.swift
//  CustomNavigationBar
//
//  Created by 享印科技 on 2019/8/30.
//  Copyright © 2019 Choshim丶Wy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UIViewController.swizzle()
         UIBarButtonItem.appearance().setBackButtonBackgroundImage(UIImage.imageFromColor(.clear), for: .normal, barMetrics: .default)
        self.window?.rootViewController = WCNavigationController(rootViewController: ViewController())
        return true
    }

}
class WCNavigationController: UINavigationController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
      
    
    }
    
 
    
    override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
}
