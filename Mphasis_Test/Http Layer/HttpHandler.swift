//
//  HttpHandler.swift
//  Mphasis_Test
//
//  Created by Mayur Nilwant on 07/10/2022.
//

import Foundation
import UIKit


// MARK: - HttpError Enum
enum HttpError: Error {
    
    case inValidUrl
    case invalidresponseCode
    case invalidData
    
}


// MARK: - HttpMethod Enum
enum HttpMethod {
    case get
    case post(Data)
}

extension HttpMethod {
    
    
    // MARK: Computed Properties for HttpMethod
    var rawValue : String {
        
        switch self {
        case .get:
             return "get"
        case .post(_):
            return "post"
        }
    }
    
    var postData : Data? {
        switch self {
        case .get:
            return nil
        case .post(let postData):
            return postData
        }
    }
}

// MARK: - Httpresult Enum

enum HttpResult<T> {
    
    case success(T?)
    case failure(HttpError?)
}


// MARK: - WebService Protocol
protocol HttpServicable {
    
    
    // MARK: - Protocol Methods
    func makeRequest(withEndPoint point: EndPoint, withHeaders header: [String: String]?,andMethod method: HttpMethod) -> URLRequest?
    func executeRequest<T: Decodable>(withRequest request: URLRequest, andResponseType responsetype: T.Type , callBack: @escaping (HttpResult<T>) -> Void)
}


extension HttpServicable {
    
    
    // MARK: - Default Methods
    func makeRequest(withEndPoint point: EndPoint, withHeaders header: [String: String]?,andMethod method: HttpMethod) -> URLRequest? {
        
        guard let url = point.url else {
            return nil
        }
        var urlRequest = URLRequest(url: url)
        if let headerDictionary = header {
            headerDictionary.forEach { key, value in
                urlRequest.addValue(value, forHTTPHeaderField: key)
            }
        }
        urlRequest.httpMethod = method.rawValue
        if let pdata = method.postData {
            urlRequest.httpBody = pdata
        }
        return URLRequest(url: url)
    }
    
    
    func executeRequest<T: Decodable>(withRequest request: URLRequest, andResponseType responsetype: T.Type , callBack: @escaping (HttpResult<T>) -> Void)
    {
            let task = URLSession.shared.dataTask(with: request) { resData, response, error in
                guard let satatusCode = (response as? HTTPURLResponse)?.statusCode, (200...299).contains(satatusCode) else {
                    callBack(.failure(HttpError.invalidresponseCode))
                    return
                }
                let result = try? JSONDecoder().decode(responsetype.self, from: resData ?? Data())
                callBack(.success(result))
            }
            task.resume()

    }
    
}
