//
//  PeopleViewModel.swift
//  Mphasis_Test
//
//  Created by Mayur Nilwant on 08/10/2022.
//

import Foundation



// MARK: Typealias for Closure
typealias PeopleViewModelCallBack = ([Person], String?) -> Void


// MARK: - RoomViewModel Class

class PeopleViewModel {
    
    // MARK: - Properties
    let peopleService: PeopleService
    let callBackForPeople : PeopleViewModelCallBack
  
    
    //We can rap error mesaage and rooms in Result Enum and pass in callBack as enhancement.
    var errorMessage: String?
    var people: [Person] = [Person]()
    
    // MARK: - RoomViewModel Init Methods
    init(withPersonService service: PeopleService, andCallBack callBack: @escaping PeopleViewModelCallBack){
        
        self.peopleService = service
        self.callBackForPeople = callBack
    }
    
  
    // MARK: - RoomViewModel Methods
    func getPeople() {
        self.peopleService.getPeople{ people in
            if people.count > 0 {
                self.errorMessage = nil
                self.people = people
            }else {
                self.errorMessage = "Unable to retrieve rooms list"
            }
            
            self.callBackForPeople(self.people, self.errorMessage)
        }
    }
    
}
