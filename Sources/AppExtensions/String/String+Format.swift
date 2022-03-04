//
//  String+FormatterExtensions.swift
//  
//
//  Created by Rodrigo Cian Berrios on 16/03/2021.
//

import UIKit


public extension String {
    
    func underlined(location: Int = 0, length: Int = 0, font: UIFont = .systemFont(ofSize: 14), color: UIColor = .blue) -> NSMutableAttributedString {
        
        let attributes: [NSAttributedString.Key: Any] = [.underlineStyle: 1,
                                                         .foregroundColor: color,
                                                         .underlineColor: color,
                                                         .font: font]
        
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttributes(attributes, range: NSRange(location: location, length: length))
        
        return attributedString
    }
}


public extension StringProtocol {
    
    var firstUppercased: String {
        return prefix(1).uppercased() + dropFirst()
    }
}
