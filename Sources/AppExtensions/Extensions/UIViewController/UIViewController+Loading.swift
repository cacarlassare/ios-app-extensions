//
//  UIViewController+Loading.swift
//  
//
//  Created by Cristian Carlassare.
//

import UIKit


public extension UIViewController {
    
    func showLoading(in view: UIView, text: String? = nil, backgroundAlpha: CGFloat = 0.4, backgroundColor: UIColor = .black) {
        LoadingIndicatorView.show(view, loadingText: text, backgroundAlpha: backgroundAlpha, backgroundColor: backgroundColor)
    }
    
    func showLoading(text: String? = nil, backgroundAlpha: CGFloat = 0.4, backgroundColor: UIColor = .black) {
        let view: UIView = UIApplication.shared.keyWindow?.rootViewController?.view ?? self.view
        self.showLoading(in: view, text: text, backgroundAlpha: backgroundAlpha, backgroundColor: backgroundColor)
    }

    func hideLoading() {
        LoadingIndicatorView.hide()
    }
}


open class LoadingIndicatorView {
    
    static var currentOverlay : UIView?
    static var currentOverlayTarget : UIView?
    static var currentLoadingText: String?
    
    
    // MARK: Show
    
    static func show(_ overlayTarget : UIView, loadingText: String?, backgroundAlpha: CGFloat, backgroundColor: UIColor) {
        // Clear it first in case it was already shown
        self.hide()
        
        // Create the overlay
        let overlay = UIView()
        overlay.alpha = 0
        overlay.backgroundColor = backgroundColor
        overlay.translatesAutoresizingMaskIntoConstraints = false
        overlayTarget.addSubview(overlay)
        overlayTarget.bringSubviewToFront(overlay)
        
        overlay.widthAnchor.constraint(equalTo: overlayTarget.widthAnchor).isActive = true
        overlay.heightAnchor.constraint(equalTo: overlayTarget.heightAnchor).isActive = true
        
        // Create and animate the activity indicator
        let indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.white)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        overlay.addSubview(indicator)
        
        indicator.centerXAnchor.constraint(equalTo: overlay.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: overlay.centerYAnchor).isActive = true
        
        // Create label
        if let textString = loadingText {
            let label = UILabel()
            label.text = textString
            label.textColor = UIColor.white
            overlay.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.topAnchor.constraint(equalTo: indicator.bottomAnchor, constant: 16).isActive = true
            label.centerXAnchor.constraint(equalTo: indicator.centerXAnchor).isActive = true
        }

        overlay.alpha = backgroundAlpha
        
        self.currentOverlay = overlay
        self.currentOverlayTarget = overlayTarget
        self.currentLoadingText = loadingText
    }
    
    
    // MARK: Hide
    
    static func hide() {
        if self.currentOverlay != nil {
            self.currentOverlay?.removeFromSuperview()
            self.currentOverlay =  nil
            self.currentLoadingText = nil
            self.currentOverlayTarget = nil
        }
    }
}
