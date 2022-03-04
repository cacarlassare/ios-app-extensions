//
//  UIImageView+TintColor.swift
//  
//
//  Created by Rodrigo Cian Berrios on 29/04/2021.
//

import UIKit


public extension UIImageView {
    
    func setImageTintColor(_ color : UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}
