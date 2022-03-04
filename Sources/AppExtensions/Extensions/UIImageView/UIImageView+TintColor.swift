//
//  UIImageView+TintColor.swift
//  
//
//  Created by Cristian Carlassare.
//

import UIKit


public extension UIImageView {
    
    func setImageTintColor(_ color : UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}
