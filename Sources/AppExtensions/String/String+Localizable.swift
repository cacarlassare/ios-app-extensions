//
//  String+Extensions.swift
//  
//
//  Created by Cristian Carlassare.
//

import Foundation


public extension String {
    
    static var forcedLanguage: String?
    
    // MARK: - Localization
    
    var localized: String {
        if let forcedLanguage = String.forcedLanguage  {
            return self.localized(for: forcedLanguage)
        }
        
        return NSLocalizedString(self, comment: "")
    }
    
    fileprivate func localized(for language: String) -> String {
        guard let path = Bundle.main.path(forResource: language, ofType: "lproj"), let bundle = Bundle(path: path) else {
            return NSLocalizedString(self, comment: "")
        }
        
        let localizedString = NSLocalizedString(self, bundle: bundle, comment: "")
        return localizedString
    }
}


// MARK: - Computed properties

extension String {
    
    public var isEmpty: Bool {
        return self.count == 0
    }
}
