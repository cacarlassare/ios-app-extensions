//
//  PullToRefreshViews.swift
//  
//
//  Created by Cristian Carlassare on 01/10/2021.
//

import UIKit


public protocol RefreshableDelegate: UIScrollViewDelegate {
    func refresh()
}

@available(iOS 10.0, *)
public extension UIScrollView {
    
    func becomeRefreshable() {
        self.refreshControl  = UIRefreshControl(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        self.refreshControl?.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
    }
    
    
    @objc private func refresh(_ sender: Any) {
        if let refreshableDelegate = self.delegate as? RefreshableDelegate {
            refreshableDelegate.refresh()
        }
    }
}
