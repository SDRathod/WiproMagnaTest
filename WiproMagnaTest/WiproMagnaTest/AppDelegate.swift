//
//  AppDelegate.swift
//  WiproMagnaTest
//
//  Created by Samir Rathod on 07/12/17.
//  Copyright © 2017 Samir Rathod. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var navObj: UINavigationController?
    
    // MARK: -  Did Finish Launching Method
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        
        let factsObj = FactsVC()
        navObj = UINavigationController.init(rootViewController: factsObj)
        window?.rootViewController = navObj;
        
        window?.makeKeyAndVisible()
        
        return true
    }

    // MARK: -  AppDelegate Life Cycle Methods
    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}

