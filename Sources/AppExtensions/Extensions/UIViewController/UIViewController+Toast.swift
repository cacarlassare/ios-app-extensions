//
//  UIViewController+showToster.swift
//  
//
//  Created by Cristian Carlassare.
//

import UIKit


public extension UIViewController {
    
    func showToast(message: String,
                   seconds: Double = 3.0,
                   backgroundColor: UIColor,
                   textColor: UIColor = UIColor.white,
                   font: UIFont = .systemFont(ofSize: 14)) {
        
        let toastLabel = UILabel()
        toastLabel.font = font
        toastLabel.text = message.localized
        self.showToasterLabel(toastLabel, seconds: seconds, backgroundColor: backgroundColor, textColor: textColor)
    }
    
    func showAttributedStringToast(attributedString: NSMutableAttributedString,
                                   seconds: Double = 3.0,
                                   backgroundColor: UIColor,
                                   textColor: UIColor = UIColor.white) {
        
        let toastLabel = UILabel()
        toastLabel.attributedText = attributedString
        self.showToasterLabel(toastLabel, seconds: seconds, backgroundColor: backgroundColor, textColor: textColor)
    }
    
    fileprivate func showToasterLabel(_ toastLabel: UILabel,
                                      seconds: Double = 3.0,
                                      backgroundColor: UIColor,
                                      textColor: UIColor = UIColor.white) {
        
        // ToastView
        let toastView = UIView()
        toastView.backgroundColor = backgroundColor
        toastView.alpha = 1.0
        toastView.layer.cornerRadius = 5
        toastView.clipsToBounds = true
        toastView.isOpaque = true
        self.view.addSubview(toastView)
        let widthAnchor = floor(self.view.frame.size.width * 0.9)
        toastView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            toastView.widthAnchor.constraint(equalToConstant: widthAnchor),
            toastView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            toastView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: (toastView.frame.height + 20) * -1),
            toastView.heightAnchor.constraint(greaterThanOrEqualToConstant: 50)
        ])
        
        //Label
        toastView.addSubview(toastLabel)
        toastLabel.textColor = textColor
        toastLabel.numberOfLines = 0
        toastLabel.textAlignment = .left
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        toastLabel.alpha = 1.0
        toastLabel.clipsToBounds  =  true
        NSLayoutConstraint.activate([
            toastLabel.centerYAnchor.constraint(equalTo: toastView.centerYAnchor),
            toastLabel.leadingAnchor.constraint(equalTo: toastView.leadingAnchor, constant: 16),
            toastLabel.trailingAnchor.constraint(equalTo: toastView.trailingAnchor, constant: -16)
        ])
        
        UIView.animate(withDuration: 0.5, delay: seconds, animations: {
            toastView.alpha = 0.0
        }, completion: {(isCompleted) in
            toastView.removeFromSuperview()
        })
    }
}
