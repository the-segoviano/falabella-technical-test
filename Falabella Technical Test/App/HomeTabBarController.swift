//
//  HomeTabBarController.swift
//  Falabella Technical Test
//
//  Created by Luis Segoviano on 03/12/21.
//

import UIKit

class HomeTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = .primaryColor
        UITabBar.appearance().barTintColor = .primaryColor
        self.tabBar.tintColor = UIColor.white
        self.tabBar.isTranslucent = false
        
        let startViewController: FavoritesViewController = FavoritesViewController()
        startViewController.tabBarItem.image = UIImage(named: "favoritos")
        
        viewControllers = [startViewController]
    }
    
}
