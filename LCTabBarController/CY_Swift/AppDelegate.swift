//
//  AppDelegate.swift
//  CY_Swift
//
//  Created by LC on 17/1/10.
//  Copyright © 2017年 LC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var main = MainViewController()
    var login = LoginViewController()
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        NotificationCenter.default.addObserver(self, selector: #selector(loginStateChange), name: NSNotification.Name(rawValue: LoginStateChange), object: nil)
        
        let navi = UINavigationController(rootViewController: login)
        window?.rootViewController = navi
        
        return true
    }
    
    
    func loginStateChange(notification:Notification){
        
        guard let bool = notification.object as? Bool  else { return }
        if bool == true {
            let viewControllerArray = ["HomeViewController","MessageViewController","ContactViewController","MineViewController"]
            let titleArray = ["首页","最新","联系人","我"]
            let imageArray = ["tab-home","tab-time","tab-guan","tab-mine"]
            let selectedImage = ["tab-home1","tab-time1","tab-guan1","tab-mine1"]
            
            
            let tabBarController = LCTabBar(viewControllerArray: viewControllerArray, titleArray: titleArray, imageArray: imageArray, selectedImageArray: selectedImage, height: 49.0)
            
            tabBarController.showPointMarkIndex(3)
            tabBarController.showBadgeMark(100, index: 2)
            tabBarController.showBadgeMark(88, index: 1)
            tabBarController.showBadgeMark(5, index: 0)
            
            window?.rootViewController = tabBarController
        } else {
            let navi = UINavigationController(rootViewController: login)
            window?.rootViewController = navi
        }
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

