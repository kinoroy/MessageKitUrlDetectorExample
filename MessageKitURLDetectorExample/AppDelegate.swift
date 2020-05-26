//
//  AppDelegate.swift
//  MessageKitURLDetectorExample
//
//  Created by Kino Roy on 2020-05-26.
//  Copyright © 2020 Kino Roy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var chatVC = ChatViewController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = chatVC
        window?.makeKeyAndVisible()
        
        return true
    }

}

