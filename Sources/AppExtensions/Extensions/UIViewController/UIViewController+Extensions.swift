//
//  UIViewController+Extensions.swift
//  
//
//  Created by Rodrigo Cian Berrios on 19/11/2020.
//

import UIKit


// MARK: - Storyboard

public extension UIViewController {
    
    static func viewController(name: String, storyboardName: String = "Main") -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: name)
        
        return viewController as! Self
    }
    
    static func fromStoryboard(name storyboardName: String = "Main") -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        
        return self.viewController(name: className, storyboardName: storyboardName)
    }
}


// MARK: - Load from NIB

public extension UIViewController {
    
    static func fromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            let nibName = String(describing: T.self)
            
            let nib = UINib(nibName: nibName, bundle:nil)
            let myVC = nib.instantiate(withOwner: T.self, options: nil).first as! T
            return myVC
        }

        return instantiateFromNib()
    }
}


// MARK: - Embed & Descale View Controllers

public extension UIViewController {
        
    func embedViewController(_ targetViewController: UIViewController?) {
        if let viewController = targetViewController, viewController.parent != self {
            viewController.view.frame = self.view.bounds
            self.view.addSubview(viewController.view)
            viewController.didMove(toParent: self)
            viewController.view.layoutSubviews()
            viewController.viewWillAppear(false)
            viewController.viewDidAppear(false)
            
            self.addChild(viewController)
        }
    }
    
    func descaleViewController(_ targetViewController: UIViewController?) {
        if let viewController = targetViewController, viewController.parent != nil {
            viewController.view.layer.removeAllAnimations()
            viewController.willMove(toParent: nil)
            viewController.viewWillDisappear(false)
            viewController.view.removeFromSuperview()
            viewController.didMove(toParent: nil)
            viewController.viewDidDisappear(false)
            
            viewController.removeFromParent()
        }
    }
}


// MARK: - Swipe Back

public extension UIViewController {
    
    func enableSwipeBack() {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        if let parsedSelf = self as? UIGestureRecognizerDelegate {
            self.navigationController?.interactivePopGestureRecognizer?.delegate = parsedSelf
        }
    }
    
    func disableSwipeBack() {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
}
