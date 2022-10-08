//
//  OccupancyButton.swift
//  Mphasis_Test
//
//  Created by Mayur Nilwant on 08/10/2022.
//

import Foundation
import UIKit


enum OccupancyStatus: String {
    
    case occupied = "Blocked"
    case available = "Book"
    
}

class OccupancyButton: UIButton {
    
    var status: OccupancyStatus = OccupancyStatus.available {
        didSet {
            self.enableDisableButton()
        }
    }
    
    
     var accessibilityValueForButton: String {
        
        get {
            if status == .available {
                return "Room is available, please press to book the room"
            }else {
                return "Room is blocked"
            }
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureButton()
    }
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    private func configureButton() {
        
        self.isAccessibilityElement = true
        self.accessibilityValue = accessibilityValueForButton
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = 5.0
        
        
    }
    
    private func enableDisableButton() {
        
        if status == .available {
            self.isUserInteractionEnabled = true
            self.alpha = 1.0
            
        }else {
            self.isUserInteractionEnabled = false
            self.alpha = 0.2
        }
        self.setTitle(self.status.rawValue, for: .normal)
        self.accessibilityValue = accessibilityValueForButton
    
    }
    
}
