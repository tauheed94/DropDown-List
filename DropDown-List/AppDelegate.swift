//
//  AppDelegate.swift
//  DropDown-List
//
//  Created by Mohd Tauheed Uddin Siddiqui on 16/11/17.
//  Copyright © 2017 Mohd Tauheed Uddin Siddiqui. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewController()
        window?.rootViewController?.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "pattern"))
        return true
    }

}

