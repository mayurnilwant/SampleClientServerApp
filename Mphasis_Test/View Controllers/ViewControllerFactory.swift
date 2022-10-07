//
//  ViewControllerFactory.swift
//  Mphasis_Test
//
//  Created by Mayur Nilwant on 07/10/2022.
//

import Foundation
import UIKit


enum ViewControllerType {
    
    case rooms
    case people
}


struct ViewControllerFactory {
    
    static func getViewControllerObject(ofType type: ViewControllerType) -> UIViewController {
                
        switch type {
        case .rooms:
            return RoomsViewController.getViewControllerObject()
        case .people:
            return PeopleViewController.getViewControllerObject()
        }
    }
}
