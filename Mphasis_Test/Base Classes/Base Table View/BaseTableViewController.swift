//
//  BaseTableViewController.swift
//  Mphasis_Test
//
//  Created by Mayur Nilwant on 08/10/2022.
//

import Foundation
import UIKit



class BaseTableViewController<T: BaseCell<U>, U> : UITableViewController {
    
    let cellIdentifier = "CellId"
    var items: [U]? = nil
    
    
    override func viewDidLoad() {
        
        
        print(String(describing: T.self))
//        self.tableView.register(T.self, forCellReuseIdentifier: String(describing: T.self))
        self.tableView.register(UINib(nibName: String(describing: T.self), bundle: nil), forCellReuseIdentifier: String(describing: T.self))
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300

        
    }
    
    //MARK: UITableView Delegate and Datasource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let items = items else {
            return 0
        }
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T
        cell?.item = items?[indexPath.row]
        return cell ?? UITableViewCell()
    }
   
}
