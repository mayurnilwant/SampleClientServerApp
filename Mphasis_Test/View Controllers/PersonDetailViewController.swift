//
//  PersonDetailViewController.swift
//  Mphasis_Test
//
//  Created by Mayur Nilwant on 08/10/2022.
//

import Foundation
import UIKit




class PersonDetailViewController: BaseTableViewController<ContactDetailCell, GenericDisplayModal> {
    
    var tableDataArray = [[String: String]]()
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Contact Details"
        self.navigationController?.navigationBar.topItem?.backButtonTitle = "`Back"
        let personDetailArray =  person?.getDisplayData().map({ displayDisctionary -> GenericDisplayModal in
            let key = displayDisctionary.keys.first
            let value = displayDisctionary[key ?? ""]
             return GenericDisplayModal(title: key ?? "", subtitle: value as! String)
        })
        
        self.items = personDetailArray
        
    }
    
}

extension PersonDetailViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
