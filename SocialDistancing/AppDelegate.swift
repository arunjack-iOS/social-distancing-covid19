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
    var mainNav: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if UserDefaults.standard.bool(forKey: "isLogin") {
            mainNav = DashboardWireFrame.assembleDashboard()
        } else {
            mainNav = LoginWireFrame.assembleLogin()
        }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = mainNav
        window?.makeKeyAndVisible()
        configureNavBarAppearance()
        return true
    }
    
    fileprivate func configureNavBarAppearance() {
        UINavigationBar.appearance().barTintColor = ColorConstants.color4981DB
        UINavigationBar.appearance().tintColor = ColorConstants.colorFFFFFF
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: ColorConstants.colorFFFFFF, NSAttributedString.Key.font: FontConstants.navBarTitle]
    }

   
}

