//
//  AppDelegate.swift
//  Falabella Technical Test
//
//  Created by Luis Segoviano on 03/12/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let startViewController: ViewController = ViewController()
        let navViewController: UINavigationController = UINavigationController(rootViewController: startViewController)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navViewController
        window?.makeKeyAndVisible()
        
        return true
    }


}

