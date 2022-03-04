//
//  UIViewController+Alert.swift
//  
//
//  Created by Cristian Carlassare.
//

import UIKit


public extension UIViewController {
    

    // MARK: - Alerts
    
    func showAlert(title: String, message: String, okButtonText: String) {
        let okAction = UIAlertAction(title: okButtonText.localized, style: .default) { action in
            self.dismiss(animated: true, completion: nil)
        }
        
        self.showAlertController(title: title, message: message, actions: [okAction], style: .alert)
    }
    
    func showAlert(title: String, message: String, okButtonText: String, okActionHandler: @escaping () -> Void) {
        
        let okAction = UIAlertAction(title: okButtonText.localized, style: .default) { _ in
            self.dismiss(animated: true, completion: nil)
            okActionHandler()
        }
        
        self.showAlertController(title: title, message: message, actions: [okAction], style: .alert)
    }
    
    
    func showAlert(title: String, message: String, okButtonText: String, cancelButtonText: String, okActionHandler: @escaping () -> Void) {
        let okAction = UIAlertAction(title: okButtonText.localized, style: .default) { _ in
            self.dismiss(animated: true, completion: nil)
            okActionHandler()
        }
        
        let cancelAction = UIAlertAction(title: cancelButtonText.localized, style: .cancel) { _ in
            self.dismiss(animated: true, completion: nil)
        }
        
        self.showAlertController(title: title, message: message, actions: [okAction, cancelAction], style: .alert)
    }
    
    
    func showAlert(title: String, message: String, okButtonText: String, cancelButtonText: String, okActionHandler: @escaping () -> Void, cancelActionHandler: @escaping () -> Void) {
        
        let okAction = UIAlertAction(title: okButtonText.localized, style: .default) { _ in
            self.dismiss(animated: true, completion: nil)
            okActionHandler()
        }
        
        let cancelAction = UIAlertAction(title: cancelButtonText.localized, style: .cancel) { _ in
            self.dismiss(animated: true, completion: nil)
            cancelActionHandler()
        }
        
        self.showAlertController(title: title, message: message, actions: [okAction, cancelAction], style: .alert)
    }
    
    
    // MARK: - Action Sheets
    
    func showActionSheet(title: String? = nil, message: String? = nil, cancelButtonText: String, actions: [UIAlertAction]) {
        var allActions: [UIAlertAction] = []
        allActions.append(contentsOf: actions)
        
        let cancelAction = UIAlertAction(title: cancelButtonText.localized, style: .cancel) { _ in
            self.dismiss(animated: true, completion: nil)
        }
        
        allActions.append(cancelAction)
        
        self.showAlertController(title: title, message: message, actions: allActions, style: .actionSheet)
    }
    
    
    
    // MARK: - Main Method
    
    fileprivate func showAlertController(title: String? = nil, message: String? = nil, actions: [UIAlertAction], style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title?.localized, message: message?.localized, preferredStyle: style)
        
        for action in actions {
            alertController.addAction(action)
        }
        
        self.present(alertController, animated: true, completion: nil)
    }
}
