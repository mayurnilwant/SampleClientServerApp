//
//  Extension+ViewController.swift
//  Mphasis_Test
//
//  Created by Mayur Nilwant on 07/10/2022.
//

import Foundation
import UIKit



extension UIViewController {
    
    static func getViewControllerObject() -> UIViewController {
        let _storyBoard = UIStoryboard(name:"Main", bundle: Bundle.main)
        let nibIdentifier = String(describing: self)
        return _storyBoard.instantiateViewController(withIdentifier: nibIdentifier) as! Self
    }
    
    
}
