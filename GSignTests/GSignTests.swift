//
//  GSignTests.swift
//  GSignTests
//
//  Created by Andrew Seeley on 24/2/19.
//  Copyright © 2019 Seemu. All rights reserved.
//

import XCTest
import Firebase
@testable import GSign

class GSignTests: XCTestCase {
    var cloth : ClothesImageUpload!

    override func setUp() {
       
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_login_wrong_password() {
        Auth.auth().signIn(withEmail: "chanakarn.po@hotmail.com",password: "wrongpassword") { (authResult, error) in
            if error != nil {
               XCTFail()
                print("wrong password")
            }else {
                XCTAssert(true)
                
            }
        }
    }
 

//    func testPerformanceExample() {
//        let item = Item( title: "ขายเสื้อนิสิตสภาพดี", price: "120", profileUrl: "https://firebasestorage.googleapis.com/v0/b/fintrade-2c2c1.appspot.com/o/images%2Fcloth1.jpg?alt=media&token=42974e27-a2f1-4dbf-a887-ebca75f31a82", text : "สภพาดีมาก" , contact :"0893456423")
//        self.measure {
//            // Put the code you want to measure the time of here.
//            self.
//        }
//
//    }
   
    

}
