//
//  RoomCell.swift
//  Mphasis_Test
//
//  Created by Mayur Nilwant on 08/10/2022.
//

import Foundation
import UIKit

class RoomCell : BaseCell<Room> {
    
    @IBOutlet weak var lblTitle: AppLabel!
    @IBOutlet weak var lblSubTitle: AppLabel!
    @IBOutlet weak var btnOccupancy: OccupancyButton!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override var item : Room!{
        didSet {
            
            self.lblTitle?.text = "Room number: \(item.identifier)"
            self.lblSubTitle?.text = "Max occupancy: \(item.maxOccupancy)"
            self.btnOccupancy.status = item.isOccupied ? .occupied : .available
        }
    }
    
}
