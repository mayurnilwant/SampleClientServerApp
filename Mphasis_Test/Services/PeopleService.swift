//
//  PeopleService.swift
//  Mphasis_Test
//
//  Created by Mayur Nilwant on 07/10/2022.
//

import Foundation
import Metal


class PeopleService: HttpServicable {
    
    func getPeople(withCallBack callBack: @escaping ([Person]) -> Void) {
        
        guard let urlRequest = self.makeRequest(withEndPoint: EndPoint.getPeople(), withHeaders: nil, andMethod: .get) else {
            callBack([Person]())
            return
        }
        
        self.executeRequest(withRequest: urlRequest, andResponseType: People.self) { result in
            
            switch result {
            case .success(let result):
                callBack(result?.persons ?? [Person]())
            case .failure(_):
                callBack([Person]())
                            
                    }
                }
        }
}
