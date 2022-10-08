//
//  RoomCell.swift
//  Mphasis_Test
//
//  Created by Mayur Nilwant on 08/10/2022.
//

import Foundation
import UIKit

class RoomCell : BaseCell<Room> {
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override var item : Room!{
        didSet {
            
            self.textLabel?.text = "Room number: \(item.identifier)"
            
            let isAvailable = item.isOccupied ? "available" : "not available"
            self.detailTextLabel?.text = "Max occupancy: \(item.maxOccupancy) and it is \(isAvailable)"
        }
    }
    
}
