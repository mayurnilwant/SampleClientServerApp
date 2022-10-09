//
//  RoomsVMTest.swift
//  Mphasis_TestTests
//
//  Created by Mayur Nilwant on 09/10/2022.
//

import XCTest
@testable import Mphasis_Test

class MockRoomService: RoomServicable {
    
    var isResultPosivite = false
    func getRooms(withCallback callBack: @escaping ([Room]) -> Void) {
        let rooms = Room()
        if isResultPosivite {
            callBack([rooms])
        }else {
            callBack([Room]())
        }
        
    }
    
    
}


class RoomsVMTest: XCTestCase {
    
    var mockRoomservice: MockRoomService!
    var roomsVM : RoomViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        mockRoomservice = MockRoomService()
        mockRoomservice.isResultPosivite = true
    }

    func test_RoomVM_Get_Rooms_Positive_Scenario() {
        
        let expectation = expectation(description: "Get Rooms")
        mockRoomservice.isResultPosivite = true
        roomsVM = RoomViewModel(withRoomService: mockRoomservice, andCallBack: {[weak self] result, errorString in
            
            print("\(result)")
            
            let room = Room.mockData()
            XCTAssertEqual(1, self?.roomsVM.rooms.count)
            XCTAssertEqual(room.createdAt, self?.roomsVM.rooms.first?.createdAt)
            XCTAssertEqual(room.identifier, self?.roomsVM.rooms.first?.identifier)
            XCTAssertEqual(room.isOccupied, self?.roomsVM.rooms.first?.isOccupied)
            XCTAssertEqual(room.maxOccupancy, self?.roomsVM.rooms.first?.maxOccupancy)
            XCTAssertNil(errorString)
            expectation.fulfill()
            
        })
        roomsVM.getRooms()
        wait(for: [expectation], timeout: 5.0)
    }
    
    func test_RoomsVM_Get_Rooms() {
        
            let expectation = expectation(description: "Get Rooms")
            mockRoomservice.isResultPosivite = false
            roomsVM = RoomViewModel(withRoomService: mockRoomservice, andCallBack: { result, errorString in
                
                print("\(result)")
                XCTAssertNotNil(errorString)
                XCTAssertEqual(errorString, "Unable to retrieve rooms list")
                expectation.fulfill()
                
            })
            roomsVM.getRooms()
            wait(for: [expectation], timeout: 5.0)
    }

}
