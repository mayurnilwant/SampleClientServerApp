//
//  AppLabel.swift
//  Mphasis_Test
//
//  Created by Mayur Nilwant on 08/10/2022.
//

import Foundation
import UIKit


//MARK: AppLabel Class
class AppLabel: UILabel {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setUp()
    }
    
    private func setUp() {
        self.textColor = UIColor.appThemeColor
        // This property is set to enable it multiple line in case of accesibility font size changes.
        self.numberOfLines = 0
        
    }
}
