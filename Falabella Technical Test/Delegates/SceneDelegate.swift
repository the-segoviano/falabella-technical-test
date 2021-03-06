//
//  SceneDelegate.swift
//  Falabella Technical Test
//
//  Created by Luis Segoviano on 03/12/21.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        if let windowScene = scene as? UIWindowScene {
            let startViewController: HomeTabBarController = HomeTabBarController()
            window = UIWindow(windowScene: windowScene)
            window?.rootViewController = startViewController
            window?.makeKeyAndVisible()
        }
        
    }


}

