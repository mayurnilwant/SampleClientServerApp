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
        
        print("\(EndPoint.getPeople().url)")
        // Do any additional setup after loading the view.
    }


}

