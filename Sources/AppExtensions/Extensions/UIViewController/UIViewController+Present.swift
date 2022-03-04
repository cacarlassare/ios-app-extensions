//
//  UIViewController+Present.swift
//  
//
//  Created by Cristian Carlassare on 14/10/2021.
//

import UIKit


public extension UIViewController {
    
    var isModal: Bool {
        return self.presentingViewController != nil
    }
    
    func presentWithNavController(viewController: UIViewController, presentationDelegate: UIAdaptivePresentationControllerDelegate) {
        let navBar: UINavigationController = UINavigationController(rootViewController: viewController)
        navBar.presentationController?.delegate = presentationDelegate
        present(navBar, animated: true, completion: nil)
    }
}
