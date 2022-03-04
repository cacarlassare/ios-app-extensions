//
//  UIViewController+TabBar.swift
//  
//
//  Created by Cristian Carlassare on 14/10/2021.
//

import UIKit


// MARK: - Tab Bar

public extension UIViewController {
    
    func hideTabBar() {
        self.tabBarController?.tabBar.isHidden = true
        self.tabBarController?.tabBar.layer.zPosition = -1
        self.tabBarController?.tabBar.frame.size.height = 0
    }
    
    func showTabBar() {
        self.tabBarController?.tabBar.isHidden = false
        self.tabBarController?.tabBar.layer.zPosition = 0
        self.tabBarController?.tabBar.frame.size.height = 50
    }
    
    func becomeTabBarDelegate() {
        if self is UITabBarControllerDelegate {
            self.tabBarController?.delegate = self as? UITabBarControllerDelegate
        }
    }
    
    func resignTabBarDelegate() {
        self.tabBarController?.delegate = nil
    }
}
