//
//  UIView+Subviews.swift
//  
//
//  Created by Natu Brasesco on 10/09/2021.
//

import UIKit


public extension UIView {
    
    var hairlineImageView: UIImageView? {
        return hairlineImageView(in: self)
    }
    
    fileprivate func hairlineImageView(in view: UIView) -> UIImageView? {
        if let imageView = view as? UIImageView, imageView.bounds.height <= 1.0 {
            return imageView
        }
        
        for subview in view.subviews {
            if let imageView = self.hairlineImageView(in: subview) { return imageView }
        }
        return nil
    }
}


public extension UIView {
    
    func fadeSubviews() {
        for view in subviews {
            view.alpha = view.alpha == 0 ? 1 : 0
        }
    }
}


// MARK: - Add and Remove subviews

public extension UIView {
    
    func removeSubViews() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
    
    func addSubViewPinningEdges(_ view: UIView, anchors: [AnchorTypes]? = nil) {
        self.addSubview(view)
        
        if let anchors = anchors {
            view.pinEdges(to: self, anchors: anchors)
        } else {
            view.pinEdges(to: self)
        }
    }
}
