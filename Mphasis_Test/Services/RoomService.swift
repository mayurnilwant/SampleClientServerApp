//
//  RoomService.swift
//  Mphasis_Test
//
//  Created by Mayur Nilwant on 07/10/2022.
//

import Foundation
import Metal


protocol RoomServicable: HttpServicable {
    func getRooms(withCallback callBack:@escaping ([Room]) -> Void)
}

class RoomService: RoomServicable {
    
    func getRooms(withCallback callBack:@escaping ([Room]) -> Void){
        
        guard let request = self.makeRequest(withEndPoint: EndPoint.getRooms(), withHeaders: nil, andMethod: .get) else {
            callBack([Room]())
            return
        }
        self.executeRequest(withRequest: request, andResponseType: Rooms.self) { result in
            switch result {
            case .success(let result):
                callBack(result?.rooms ?? [Room]())
            case .failure(_):
                callBack([Room]())
            }
        }
        
    }
    
    
    
}
