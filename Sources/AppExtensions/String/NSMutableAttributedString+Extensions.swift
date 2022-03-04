//
//  File.swift
//  
//
//  Created by Cristian Carlassare.
//

import UIKit


public struct AttributesMask {
    
    public init(occurrence: String, attributes: [NSAttributedString.Key:Any]) {
        self.occurrence = occurrence
        self.attributes = attributes
    }
    
    let occurrence: String
    let attributes: [NSAttributedString.Key:Any]
}


public extension NSMutableAttributedString {

    func setAttributes(attributesMasks: [AttributesMask]) -> NSMutableAttributedString{
        
        for mask in attributesMasks {
            guard let startIndex = self.string.range(of: mask.occurrence)?.lowerBound, let endIndex = self.string.range(of: mask.occurrence, options: .backwards)?.upperBound else { return NSMutableAttributedString()}
            
            let attributedText = String(self.string[startIndex..<endIndex])
            if let range = self.string.range(of: attributedText){
                let convertedRange = NSRange(range, in: self.string)
                
                self.addAttributes(mask.attributes, range: convertedRange)
            }
        }
        
        return self
    }
 }
