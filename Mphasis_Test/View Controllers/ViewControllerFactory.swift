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
    case personDetail
}


struct ViewControllerFactory {
    
    static func getViewControllerObject(ofType type: ViewControllerType, andPassableObject object: ViewControllerPassableObject? = nil) -> UIViewController {
                
        switch type {
        case .rooms:
            return RoomsViewController.getViewControllerObject()
        case .people:
            return PeopleViewController.getViewControllerObject()
        case .personDetail:
            var personDC = PersonDetailViewController.getViewControllerObject() as? PersonDetailViewController
            personDC?.person = object as! Person
            return personDC ?? UIViewController()
        }
    }
}
