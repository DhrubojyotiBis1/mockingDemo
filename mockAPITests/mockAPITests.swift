//
//  mockAPITests.swift
//  mockAPITests
//
//  Created by Dhrubojyoti on 31/03/20.
//  Copyright © 2020 Dhrubojyoti. All rights reserved.
//

import XCTest
@testable import mockAPI

class mockAPITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testForRecevingDataFormServer(){
        let apiservices = MockAPI()
        
        let dummyURL = URL(string: "https://dummyURL")!
        
        var data:userData?
        apiservices.googleSignIn(withUrl: dummyURL){(userData,error) in
            data = userData
        }
        
        XCTAssertNotNil(data)
    }

    func testIsValidResponse(){
        
        let apiservices = MockAPI()
        
        let dummyURL = URL(string: "https://dummyURL")!
        
        var data:userData?
        apiservices.googleSignIn(withUrl: dummyURL){(userData,error) in
            data = userData
        }
        XCTAssertEqual(data,userData().data(for: .sucess))
    }

}
