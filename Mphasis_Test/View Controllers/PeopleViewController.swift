//
//  PeopleViewController.swift
//  Mphasis_Test
//
//  Created by Mayur Nilwant on 07/10/2022.
//

import Foundation
import UIKit


class PeopleViewController: BaseTableViewController<PersonCell, Person> {
     var peopleVM : PeopleViewModel?
    
    override func viewDidLoad() {
        self.configureRoomVM()
        self.getPeopList()
        self.title = "Contacts"
    }
    
    
    
    private func configureRoomVM() {
        
        let personService = PeopleService()
        self.peopleVM = PeopleViewModel(withPersonService: personService, andCallBack:{ people, errorString in
            
            if let errorString = errorString {
                    //Error retrieving data
                print(errorString)
            }else {
                self.items = people
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }

            
        })

    }
    
    private func getPeopList()  {
        self.peopleVM?.getPeople()
    }

}

extension PeopleViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let personModel = items?[indexPath.row]
        let personDetailVC = ViewControllerFactory.getViewControllerObject(ofType: .personDetail, andPassableObject: personModel)
        self.navigationController?.pushViewController(personDetailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
