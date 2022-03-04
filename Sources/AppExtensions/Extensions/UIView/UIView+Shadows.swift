//
//  UIView+Shadows.swift
//  
//
//  Created by Cristian Carlassare.
//

import UIKit


public extension UIView {

    func setShadow(color: UIColor = .black, opacity: Float = 0.5, offset: CGSize = CGSize.zero) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = self.layer.cornerRadius
    }
    
    
    @objc func shadowDecorate(color: UIColor = .black, opacity: Float = 0.1, offset: CGSize = .zero, radius: CGFloat = 0) {
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.clear.cgColor
        self.clipsToBounds = true
        
        self.layer.shadowRadius = radius
        self.setShadow(color: color, opacity: opacity, offset: offset)
        
        self.layer.masksToBounds = false
    }
}
