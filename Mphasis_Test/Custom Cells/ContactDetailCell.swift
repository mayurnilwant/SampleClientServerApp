//
//  ContactDetailCell.swift
//  Mphasis_Test
//
//  Created by Mayur Nilwant on 08/10/2022.
//

import Foundation
import UIKit

class ContactDetailCell: BaseCell<GenericDisplayModal> {
    
    @IBOutlet weak var lblTitle: AppLabel!
    @IBOutlet weak var lblValue: AppLabel!
    
    override var item: GenericDisplayModal!{
        didSet {
            self.lblTitle.text = item.title
            self.lblValue.text = item.subtitle
        }
    }
}
