//
//  AttributeStringBuilder.swift
//  
//
//  Created by Rodrigo Cian Berrios on 07/05/2021.
//

import UIKit


public typealias Attributes = [NSAttributedString.Key: Any]


public enum FontAttribute {
    case bold(CGFloat), semibold(CGFloat), regular(CGFloat), medium(CGFloat), light(CGFloat)
    
    public var attribute: Attributes {
        return [.font: font]
    }
    
    public var font: UIFont {
        switch self {
            case .light(let size):
                return .systemFont(ofSize: size, weight: .light)
            case .regular(let size):
                return .systemFont(ofSize: size, weight: .regular)
            case .medium(let size):
                return .systemFont(ofSize: size, weight: .medium)
            case .semibold(let size):
                return .systemFont(ofSize: size, weight: .semibold)
            case .bold(let size):
                return .systemFont(ofSize: size, weight: .bold)
        }
    }
}


public class AttributeStringBuilder {
    
    private(set) var attributes: NSMutableDictionary = NSMutableDictionary()
    
    
    public init() { }
    
    public func color(_ color: UIColor) -> AttributeStringBuilder {
        attributes.addEntries(from: [NSAttributedString.Key.foregroundColor: color])
        return self
    }
    
    public func font(_ attribute: FontAttribute) -> AttributeStringBuilder {
        attributes.addEntries(from: attribute.attribute)
        return self
    }
    
    public func underline(_ style: NSUnderlineStyle) -> AttributeStringBuilder {
        attributes.addEntries(from: [NSAttributedString.Key.underlineStyle: style.rawValue])
        return self
    }
    
    public func underlineColor(_ color: UIColor) -> AttributeStringBuilder {
        attributes.addEntries(from: [NSAttributedString.Key.underlineColor: color])
        return self
    }
    
    public func kern(_ value: CGFloat) -> AttributeStringBuilder {
        attributes.addEntries(from: [NSAttributedString.Key.kern: value])
        return self
    }
    
    public func strikethroughStyle(_ style: NSUnderlineStyle) -> AttributeStringBuilder {
        attributes.addEntries(from: [NSAttributedString.Key.strikethroughStyle: style.rawValue])
        return self
    }
    
    public func strikethroughColor(_ color: UIColor) -> AttributeStringBuilder {
        attributes.addEntries(from: [NSAttributedString.Key.strikethroughColor: color])
        return self
    }
    
    public func build() -> Attributes {
        return (attributes as? Attributes) ?? [:]
    }
}
