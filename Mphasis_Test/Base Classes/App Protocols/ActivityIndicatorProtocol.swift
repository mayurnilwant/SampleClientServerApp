//
//  ActivityIndicatorProtocol.swift
//  Mphasis_Test
//
//  Created by Mayur Nilwant on 09/10/2022.
//

import Foundation
import UIKit


protocol ActivityIndicatorProtocol where Self : UIViewController {
    
    var activityIndicator: UIActivityIndicatorView? {get set}
    func configureActivityIndicatorView()
    func showActivityIndicator()
    func hideActivityIndicator()
    
}

extension ActivityIndicatorProtocol {
    
    func configureActivityIndicatorView() {
        if #available(iOS 13.0, *) {
            activityIndicator = UIActivityIndicatorView(style: .medium)
        } else {
            activityIndicator = UIActivityIndicatorView(style:.whiteLarge)
        }
        activityIndicator?.color = UIColor.appThemeColor(withOpacity: 0.3)
        activityIndicator?.hidesWhenStopped = true
        self.addConstraint()
    }
    
    func hideActivityIndicator() {
        self.activityIndicator?.isHidden = true
        activityIndicator?.removeFromSuperview()
        
    }
    
    func showActivityIndicator(){
        self.activityIndicator?.isHidden = false
        
        guard let activityView = self.activityIndicator else {
            return
        }
        activityView.startAnimating()
        
    }
    
  private  func addConstraint() {
      
      guard let activityIndicator = self.activityIndicator else {
          return
      }
      self.view.addSubview(activityIndicator)
      activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor), activityIndicator.widthAnchor.constraint(equalToConstant: 50.0), activityIndicator.heightAnchor.constraint(equalToConstant: 50.0)]
        NSLayoutConstraint.activate(constraints)
        
    }
}
