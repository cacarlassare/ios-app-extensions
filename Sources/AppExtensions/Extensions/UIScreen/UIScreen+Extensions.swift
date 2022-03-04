//
//  UIScreen+Extensions.swift
//  
//
//  Created by Cristian Carlassare.
//

import UIKit


public extension UIScreen {
    
    var aspectRatio: CGFloat {
        let deviceWidth = UIScreen.main.bounds.width * UIScreen.main.scale
        let deviceHeight = UIScreen.main.bounds.height * UIScreen.main.scale
        let testDeviceAspectRatio = deviceHeight / deviceWidth
        
        return testDeviceAspectRatio
    }
}
