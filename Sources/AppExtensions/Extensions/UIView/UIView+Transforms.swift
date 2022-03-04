//
//  UIView+Transforms.swift
//  
//
//  Created by Cristian Carlassare.
//

import UIKit


public extension UIView {
    
    func makeCircle() {
        self.layer.cornerRadius = min(self.frame.size.height, self.frame.size.width) / 2
    }
    
    func setCornerRadius(cornerRadius:CGFloat) {
        self.layer.cornerRadius = cornerRadius
    }
}
