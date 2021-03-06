//
//  AppDelegate.swift
//  Scale
//
//  Created by Maxime Defauw on 02/11/15.
//  Copyright © 2015 Maxime Defauw. All rights reserved.
//

import UIKit
enum Shortcut:String {
    case openBlue = "OpenBlue"
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
        [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        print("didFinishLaunchingWithOptions called")
        var isLaunchedFromQuickAction = false
        
        // Check if it's launched from Quick Action
        if let shortcutItem = launchOptions?[UIApplicationLaunchOptionsKey.shortcutItem] as? UIApplicationShortcutItem {
            
            isLaunchedFromQuickAction = true
            // Handle the sortcutItem
            handleQuickAction(shortcutItem)
        } else {
            self.window?.backgroundColor = UIColor.white
        }
        
        // Return false if the app was launched from a shortcut, so performAction... will not be called.
        return !isLaunchedFromQuickAction
    }
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        completionHandler(handleQuickAction(shortcutItem))
    }

    func handleQuickAction(_ shortcutItem: UIApplicationShortcutItem) -> Bool {
     
        var quickActionHandled = false
        let type  = shortcutItem.type.components(separatedBy: ".").last!
        if let shortcutType = Shortcut.init(rawValue: type) {
            switch shortcutType {
            case .openBlue:
                self.window?.backgroundColor = UIColor(red: 151.0/255.0, green: 187.0/255.0, blue: 255.0/255.0, alpha: 1.0)
                quickActionHandled = true
            }
        }
        
        return quickActionHandled
    }
}

