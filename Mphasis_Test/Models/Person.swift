//
//  People.swift
//  Mphasis_Test
//
//  Created by Mayur Nilwant on 07/10/2022.
//

import Foundation


struct People : Decodable {
    
    var persons : [Person]?
    
    init(from decoder: Decoder) throws {
        
        do {
            
            var container = try decoder.unkeyedContainer()
            self.persons = [Person]()
            while !container.isAtEnd {
                    
                do {
                    let person  = try container.decode(Person.self)
                    self.persons?.append(person)
                }catch {
                    print(error)
                }
            }
            
            
        }catch {
            print("Decoding error: \(error)")
        }
    }
}


struct  Person : Decodable {
    
    var firstName : String = ""
    var lastName : String = ""
    var avatar : String = ""
    var email : String = ""
    var favouriteColor : String = ""
    var identifier : String = ""
    var jobTitle: String = ""
    var createdAt : String
    var profilePic : Data?
    
    var fullName : String {
        
        return self.firstName + " " + self.lastName
    }
    

    enum CodingKeys: String, CodingKey {
        
        case firstName = "firstName"
        case lastName =  "lastName"
        case avatar =  "avatar"
        case email = "email"
        case favouriteColor = "favouriteColor"
        case identifier = "id"
        case jobTitle = "jobtitle"
        case createdAt = "createdAt"
    }
    

    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.firstName = try container.decodeIfPresent(String.self, forKey: CodingKeys.firstName) ?? ""
        self.jobTitle = try container.decodeIfPresent(String.self, forKey: CodingKeys.jobTitle) ?? ""
        self.lastName = try container.decodeIfPresent(String.self, forKey: CodingKeys.lastName) ?? ""
        self.avatar = try container.decodeIfPresent(String.self, forKey: CodingKeys.avatar) ?? ""
        self.email = try container.decodeIfPresent(String.self, forKey: CodingKeys.email) ?? ""
        self.identifier = try container.decodeIfPresent(String.self, forKey: CodingKeys.identifier) ?? ""
        self.favouriteColor = try container.decodeIfPresent(String.self, forKey: CodingKeys.favouriteColor) ?? ""
        self.createdAt = try container.decodeIfPresent(String.self, forKey: CodingKeys.createdAt) ?? ""
        self.jobTitle = try container.decodeIfPresent(String.self, forKey: CodingKeys.jobTitle) ?? ""

    }
    

}
