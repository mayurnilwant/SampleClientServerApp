//
//  Rooms.swift
//  Mphasis_Test
//
//  Created by Mayur Nilwant on 07/10/2022.
//

import Foundation


struct Rooms: Decodable {

    var rooms  = [Room]()
    init(from decoder: Decoder) throws {

        var container = try decoder.unkeyedContainer()
        self.rooms = [Room]()
        while !container.isAtEnd {

            do {
                    let room = try container.decode(Room.self)
                    self.rooms.append(room)
            }catch {
                print(error)
            }
        }


    }

    }



struct Room : Decodable {
    var createdAt: String = ""
    var maxOccupancy = 0
    var isOccupied = false
    var identifier = ""
    

    enum CodingKeys : String, CodingKey {
        case createdDate = "createdAt"
        case maxOccupancy = "maxOccupancy"
        case isOccupied = "isOccupied"
        case identifier = "id"
    }
    
    
    
    init(from decoder: Decoder) throws {
        
        do {
            let containder = try decoder.container(keyedBy: CodingKeys.self)
            self.createdAt = try containder.decodeIfPresent(String.self, forKey: CodingKeys.createdDate) ?? ""
            self.maxOccupancy = try  containder.decodeIfPresent(Int.self, forKey: CodingKeys.maxOccupancy) ?? 0
            self.isOccupied = try containder.decodeIfPresent(Bool.self, forKey: CodingKeys.isOccupied) ?? false
            self.identifier = try containder.decodeIfPresent(String.self, forKey: CodingKeys.identifier) ?? ""
            
        }catch {
            
            print(error.localizedDescription)
        }
        
        
    }
    
}

extension Room {
    init()
        {
            createdAt = "2022-01-24T20:52:50.765Z"
            maxOccupancy = 53539
            isOccupied = false
            identifier = "1"
        }
    
    static func mockData() -> Room {
        
        return Room()
    }
    
}
