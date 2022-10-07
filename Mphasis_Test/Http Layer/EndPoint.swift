//
//  EndPoint.swift
//  Mphasis_Test
//
//  Created by Mayur Nilwant on 07/10/2022.
//

import Foundation


enum ProjectEnviornment : String {
    
    case production = "61e947967bc0550017bc61bf.mockapi.io"
    case staging = "staging/61e947967bc0550017bc61bf.mockapi.io"
    case testing = "test/61e947967bc0550017bc61bf.mockapi.io"
}

// MARK: - HttpScheme Enum
enum HttpScheme: String {
    
    case HTTP = "http"
    case HTTPS = "https"
}



// MARK: - EndPointPaths Enum
enum EndPointPaths: String {
    case rooms = "/rooms"
    case people = "/people"
}


// MARK: - EndPointPaths Extension
extension EndPointPaths {
    
    private var intermediatePath : String {
      return "/api/v1/"
    }
    func getPath() -> String {
        return intermediatePath + self.rawValue
    }
}


// MARK: - EndPoint
struct EndPoint {
    
    private var scheme: String
    private var host: String
    private var queryParameters: [String: String]?
    private var path: EndPointPaths?
    
    
    // MARK: - Init methods
    private init() {
        self.scheme = HttpScheme.HTTPS.rawValue
        self.host = ProjectEnviornment.production.rawValue
    }
    
    init(withPath path: EndPointPaths?, andQParam qParam: [String: String]? = nil) {
        
        self.init()
        if let path = path {
            self.path = path
        }
        if let qParam = qParam {
            self.queryParameters = qParam
        }
    }
    
}

extension EndPoint {
    
    var url : URL? {
        
        var urlComponent = URLComponents()
        
        urlComponent.scheme = self.scheme
        urlComponent.host = self.host
        if let _path = self.path {
            urlComponent.path = _path.getPath()
        }
        
        if let param = self.queryParameters {
            urlComponent.queryItems = param.map({ key, value in
                return URLQueryItem(name: value, value: key)
            })
        }
        return urlComponent.url
    }
}


extension EndPoint {
    
    static func getPeople() -> Self {
        EndPoint(withPath: EndPointPaths.people)
    }

    static func getRooms() -> Self {
        EndPoint(withPath: EndPointPaths.rooms)
    }
}



