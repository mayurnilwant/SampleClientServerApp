//
//  ViewController.swift
//  Mphasis_Test
//
//  Created by Mayur Nilwant on 07/10/2022.
//

import UIKit

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let roomService = RoomService().getRooms { rooms in
            
            print("resule: \(rooms.debugDescription)")
        }
        
        
    
        
        // Do any additional setup after loading the view.
    }


}

