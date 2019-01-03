//
//  DigitAdderTests.swift
//  DigitAdderTests
//
//  Created by Kalyani Chinchane on 12/12/18.
//  Copyright © 2018 globant. All rights reserved.
//

import XCTest
@testable import DigitAdder

class DigitAdderTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRandomNumberGenerator() {
        
        let stringRandom = Utility.sharedInstance.generateRandomNumber()
        XCTAssertNotNil(stringRandom as? String)
        
        XCTAssertEqual(stringRandom.count, 4)
        
        if let intRandowm = Int(stringRandom){
            XCTAssertGreaterThan(intRandowm, 0)
        }
        
    }
    
    func testGetScores(){
        let score = Utility.sharedInstance.getScore()
       XCTAssertGreaterThanOrEqual(score,0)
    }
    
    
    func testAnswer(){
        
        let ans = 1111 - 0000
        let status = Utility.sharedInstance.verifyAnswerfor(input: 0000, numbers: 1111)
        if ans == 0 {
            XCTAssertTrue(status)
        }
        else {
            XCTAssertFalse(status)
        }
    }

}
