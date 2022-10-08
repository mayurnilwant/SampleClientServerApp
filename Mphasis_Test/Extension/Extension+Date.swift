//
//  Extension+Date.swift
//  Mphasis_Test
//
//  Created by Mayur Nilwant on 08/10/2022.
//

import Foundation


extension Date {
    
    static func getDisplayValue(fromString strDate: String) -> String {
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"//
        
        guard let  _tempDate = dateFormatterGet.date(from: strDate) else {
            return ""
        }
        let printDateFormat = DateFormatter()
        printDateFormat.dateFormat = "MMM d, yyyy"
        return printDateFormat.string(from: _tempDate)
    }
}
