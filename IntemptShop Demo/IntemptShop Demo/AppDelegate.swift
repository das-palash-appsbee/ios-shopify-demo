//
//  AppDelegate.swift
//  IntemptShop Demo
//
//  Created by Intempt on 29/08/20.
//  Copyright © 2020 Intempt. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    //  MARK: - Application Launch -
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        /* ----------------------------------------
         ** Initialize the cart controller and pre-
         ** load any cached cart items.
         */
        UNUserNotificationCenter.current().delegate = PushManager.sharedInstance
        PushManager.sharedInstance.registerForPushNotifications()
        _ = CartController.shared
        
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        PushManager.sharedInstance.didRegisterForRemoteNotifications(deviceToken: deviceToken)
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("didFailToRegisterForRemoteNotificationsWithError: \(error)")
    }
}

