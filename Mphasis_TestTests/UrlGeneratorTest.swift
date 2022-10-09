//
//  UrlGeneratorTest.swift
//  Mphasis_TestTests
//
//  Created by Mayur Nilwant on 09/10/2022.
//

import XCTest
@testable import Mphasis_Test

class UrlGeneratorTest: XCTestCase {

    var roomsEndPoint : EndPoint!
    var peopleEndPoint : EndPoint!
    
    
    override func setUpWithError() throws {
        roomsEndPoint = EndPoint.getRooms()
        peopleEndPoint = EndPoint.getPeople()
    }

    func test_Get_Rooms_EndPoint() {
        let roomsUrlString = "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/rooms"
        let generatedUrlString = roomsEndPoint.url?.absoluteString ?? ""
        XCTAssertEqual(roomsUrlString, generatedUrlString)
    }
    
    
    func test_Get_People_EndPoint() {
        let peopleUrlString = "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/people"
        let generatedUrlString = peopleEndPoint.url?.absoluteString ?? ""
        XCTAssertEqual(peopleUrlString, generatedUrlString)
    }

}
