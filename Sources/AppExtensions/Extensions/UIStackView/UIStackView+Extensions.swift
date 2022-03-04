//
//  UIStackView+Extensions.swift
//  
//
//  Created by Cristian Carlassare.
//

import UIKit


public extension UIStackView {
    
    func removeArrangedSubViews() {
        for view in self.arrangedSubviews {
            view.removeFromSuperview()
        }
    }
}
