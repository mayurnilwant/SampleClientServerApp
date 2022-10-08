//
//  PersonDetailViewController.swift
//  Mphasis_Test
//
//  Created by Mayur Nilwant on 08/10/2022.
//

import Foundation




class PersonDetailViewController: BaseTableViewController<ContactDetailCell, GenericDisplayModal> {
    
    var tableDataArray = [[String: String]]()
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let personDetailArray =  person?.getDisplayData().map({ displayDisctionary -> GenericDisplayModal in
            let key = displayDisctionary.keys.first
            let value = displayDisctionary[key ?? ""]
             return GenericDisplayModal(title: key ?? "", subtitle: value as! String)
        })
        self.items = personDetailArray
    }
    
}
