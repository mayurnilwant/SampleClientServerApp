//
//  ViewController.swift
//  Mphasis_Test
//
//  Created by Mayur Nilwant on 07/10/2022.
//

import UIKit

class RoomsViewController: UIViewController {

    var roomsVM : RoomViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureRoomVM()
        self.getRoomList()
        
        
    }

    private func configureRoomVM() {
        
        let roomService = RoomService()
        self.roomsVM = RoomViewModel(withRoomService: roomService, andCallBack: { rooms, errorString in
            if let errorString = errorString {
                    //Error retrieving data
                print(errorString)
            }else {
                // Success
            }
            
        })
    }
    
    private func getRoomList()  {
        self.roomsVM?.getRooms()
    }
}

