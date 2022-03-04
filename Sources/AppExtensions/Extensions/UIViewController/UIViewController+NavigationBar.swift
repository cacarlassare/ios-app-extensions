//
//  UIViewController+NavigationBar.swift
//  
//
//  Created by Cristian Carlassare on 14/10/2021.
//

import UIKit


// MARK: - Navigation Bar

public extension UIViewController {
    
    func setNavBarBackgroundColor(color: UIColor, transitionTime: TimeInterval? = nil) {
        if transitionTime == nil {
            self.navigationController?.navigationBar.barTintColor = color
            self.setNavBarAppearance(color: color)
        } else {
            UIView.animate(withDuration: transitionTime!, animations: {
                self.navigationController?.navigationBar.barTintColor = color
                self.setNavBarAppearance(color: color)
            })
        }
    }
    
    func setNavBarSolidBackground(color: UIColor) {
        let solidBackground = UIView()
        
        var bounds = self.navigationController?.navigationBar.bounds ?? CGRect(x: 0, y: 0, width: 0, height: 0)
        bounds.size.height += UIApplication.shared.statusBarFrame.size.height
        solidBackground.frame = bounds
        solidBackground.backgroundColor = color
        
        let solidBackgroundImage = solidBackground.asImage()
        self.navigationController?.navigationBar.setBackgroundImage(solidBackgroundImage, for: .default)
        
        self.setNavBarAppearance(color: color)
    }
    
    func setNavBarTitle(_ title: String, color: UIColor = UIColor.black, font: UIFont = UIFont.systemFont(ofSize: 17, weight: .semibold)) {
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 35))
        titleLabel.font = font
        titleLabel.textColor = color
        titleLabel.text = title.localized
        titleLabel.sizeToFit()
        titleLabel.numberOfLines = 2
        titleLabel.minimumScaleFactor = 0.6
        
        self.navigationItem.titleView = titleLabel
    }

    func showNavBar(animated: Bool = true, enableSwipeBack: Bool = true) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        
        if enableSwipeBack {
            self.enableSwipeBack()
        }
    }
    
    func hideNavBar(animated: Bool = true, disableSwipeBack: Bool = false) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
        if disableSwipeBack {
            self.disableSwipeBack()
        }
    }
    
    
    // MARK: - Nav Bar Appearance Function
    
    func setNavBarAppearance(color: UIColor) {
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = color
            
            self.navigationController?.navigationBar.standardAppearance = appearance
            self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
    }
}
