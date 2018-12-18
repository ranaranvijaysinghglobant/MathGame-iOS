//
//  MainVCUITest.swift
//  DigitAdderUITests
//
//  Created by Kalyani Chinchane on 12/12/18.
//  Copyright © 2018 globant. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import DigitAdder

class MainVCUITest: FBSnapshotTestCase {
    var sut: MainViewController!
    
    override func setUp() {
        super.setUp()
        setupViewController()
        //recordMode = true

    }
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupViewController()
    {
        sut =  MainViewController()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: type(of: self)))
        
        sut = storyboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController
        
        sut.loadView()
    }
    
    func loadView()
    {
        let validation = expectation(description: "FullFill")
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Double(NSEC_PER_SEC)) / Double(NSEC_PER_SEC), execute: {
            validation.fulfill()
            self.FBSnapshotVerifyView(self.sut.view)
        })

        self.waitForExpectations(timeout: 10){ error in }

    }
    
    // MARK: Tests
    
    func testShouldFetchGistsWhenViewIsLoaded()
    {
        // When
        loadView()
    }
}
