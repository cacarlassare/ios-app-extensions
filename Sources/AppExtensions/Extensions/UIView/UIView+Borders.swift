//
//  UIView+Borders.swift
//  
//
//  Created by Cristian Carlassare on 25/03/2021.
//

import UIKit


public extension UIView {
    
    func setBorder(color: UIColor, width: CGFloat = 1.0, cornerRadius: CGFloat = 0.0) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
    }
}
