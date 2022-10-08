//
//  AppLabel.swift
//  Mphasis_Test
//
//  Created by Mayur Nilwant on 08/10/2022.
//

import Foundation
import UIKit


class AppLabel: UILabel {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setUp()
    }
    
    private func setUp() {
        self.textColor = UIColor.appThemeColor
        self.numberOfLines = 0
        
    }
}
