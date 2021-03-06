//
//  NSAttributedString+Extensions.swift
//  
//
//  Created by Cristian Carlassare.
//

import Foundation


public extension NSAttributedString {
    
    static func + (left: NSAttributedString, right: NSAttributedString) -> NSAttributedString {
        let result = NSMutableAttributedString()
        result.append(left)
        result.append(right)
        return result
    }
    
    static func + (left: String, right: NSAttributedString) -> NSAttributedString {
        let result = NSMutableAttributedString(string: left)
        result.append(right)
        return result
    }
    
    static func + (left: NSAttributedString, right: String) -> NSAttributedString {
        let leftCopy = NSMutableAttributedString(attributedString: left)
        let rightAttr = NSMutableAttributedString(string: right)
        leftCopy.append(rightAttr)
        return leftCopy
    }
}
