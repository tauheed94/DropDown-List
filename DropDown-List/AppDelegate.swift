//
//  AppDelegate.swift
//  DropDown-List
//
//  Created by Mohd Tauheed Uddin Siddiqui on 16/11/17.
//  Copyright © 2017 Mohd Tauheed Uddin Siddiqui. All rights reserved.
//

import UIKit
import MMDrawerController
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var drawer : MMDrawerController?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
       // window?.rootViewController = ViewController()
        
        drawer = MMDrawerController(center: ViewController(), leftDrawerViewController: sideMenu(), rightDrawerViewController: sideMenu())
        drawer?.openDrawerGestureModeMask = MMOpenDrawerGestureMode.panningCenterView
        drawer?.closeDrawerGestureModeMask = MMCloseDrawerGestureMode.panningCenterView
        
        window?.rootViewController = drawer
        window?.rootViewController?.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "pattern-side"))
        return true
    }

}

