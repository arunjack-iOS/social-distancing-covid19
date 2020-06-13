//
//  AppDelegate.swift
//  SocialDistancing
//
//  Created by Arun Jack on 27/04/20.
//  Copyright © 2020 Arun Jack. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let mainNav = DashboardWireFrame.assembleDashboard()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = mainNav
        window?.makeKeyAndVisible()

        configureNavBarAppearance()
        saveCredentials()
        return true
    }
    
    fileprivate func configureNavBarAppearance() {
        UINavigationBar.appearance().barTintColor = ColorConstants.color4981DB
        UINavigationBar.appearance().tintColor = ColorConstants.colorFFFFFF
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: ColorConstants.colorFFFFFF, NSAttributedString.Key.font: FontConstants.navBarTitle]
    }

    func saveCredentials() {
        UserDefaults.standard.setValue("testuser", forKey: "username")
        UserDefaults.standard.setValue("1234", forKey: "otp")
    }
}

