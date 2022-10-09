//
//  Extension+Color.swift
//  Mphasis_Test
//
//  Created by Mayur Nilwant on 08/10/2022.
//

import Foundation
import UIKit
import SwiftUI


extension UIColor {
    
    static var appThemeColor : UIColor {
        
        return UIColor(red: (196.0/255.0), green: (2.0/255.0), blue: (2.0/255.0), alpha: 1.0)

    }
}


@available(iOS 13.0, *)
extension UIColor {
    var suColor: Color {
        get {
            let rgbColours = self.cgColor.components
            return Color(
                red: Double(rgbColours![0]),
                green: Double(rgbColours![1]),
                blue: Double(rgbColours![2])
            )
        }
    }
}
