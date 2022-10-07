//
//  RoomViewModel.swift
//  Mphasis_Test
//
//  Created by Mayur Nilwant on 07/10/2022.
//

import Foundation



// MARK: Typealias for Closure
typealias RoomViewmodelCallBack = ([Room], String?) -> Void


// MARK: - RoomViewModel Class

class RoomViewModel {
    
    // MARK: - Properties
    let roomService: RoomServicable
    let callBackForRooms : RoomViewmodelCallBack
  
    
    //We can rap error mesaage and rooms in Result Enum and pass in callBack as enhancement.
    var errorMessage: String?
    var rooms: [Room] = [Room]()
    
    // MARK: - RoomViewModel Init Methods
    init(withRoomService service: RoomServicable, andCallBack callBack: @escaping RoomViewmodelCallBack){
        
        self.roomService = service
        self.callBackForRooms = callBack
    }
    
  
    // MARK: - RoomViewModel Methods
    func getRooms() {
        self.roomService.getRooms { rooms in
            if rooms.count > 0 {
                self.errorMessage = nil
                self.rooms = rooms
            }else {
                self.errorMessage = "Unable to retrieve rooms list"
            }
            
            self.callBackForRooms(self.rooms, self.errorMessage)
        }
    }
    
}
