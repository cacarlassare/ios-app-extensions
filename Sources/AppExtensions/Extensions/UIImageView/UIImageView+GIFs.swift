//
//  UIImageView+GIFs.swift
//  
//
//  Created by Cristian Carlassare.
//

import UIKit


public extension UIImageView {
    
    func setGifImage(named name: String, duration: TimeInterval) {
        let images = animatedImages(for: name)
        
        self.animationImages = images
        self.animationDuration = duration
        self.startAnimating()
    }
    
    private func animatedImages(for name: String) -> [UIImage] {
        
        var i = 0
        var images = [UIImage]()
        while let image = UIImage(named: "\(name)_\(i)") {
            images.append(image)
            i += 1
        }
        
        return images
    }
}
