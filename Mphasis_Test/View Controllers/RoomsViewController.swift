//
//  ViewController.swift
//  Mphasis_Test
//
//  Created by Mayur Nilwant on 07/10/2022.
//

import UIKit

class BaseCell<U: Any>: UITableViewCell {
    var item: U!
}


class RoomsViewController: BaseTableViewController<RoomCell, Room>, ActivityIndicatorProtocol{
    
    var activityIndicator: UIActivityIndicatorView?
    var roomsVM : RoomViewModel?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "Rooms"
        self.configureActivityIndicatorView()
        self.configureRoomVM()
        self.getRoomList()
        
        
    }

    private func configureRoomVM() {
        
        let roomService = RoomService()
        showActivityIndicator()
        self.roomsVM = RoomViewModel(withRoomService: roomService, andCallBack: {[weak self] rooms, errorString in
            DispatchQueue.main.async {
                self?.hideActivityIndicator()
            }
            if let errorString = errorString {
                    //Error retrieving data
                print(errorString)
            }else {
                self?.items = rooms
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
            
        })
    }
    
    private func getRoomList()  {
        self.roomsVM?.getRooms()
    }
}

