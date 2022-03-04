//
//  String+Extensions.swift
//  
//
//  Created by Rodrigo Cian Berrios on 19/11/2020.
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
        let path = Bundle.main.path(forResource: language, ofType: "lproj")!
        let bundle = Bundle(path: path)!
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
