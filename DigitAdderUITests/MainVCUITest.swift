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
    var window: UIWindow!
    

    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupViewController()
        recordMode = true

    }
    override func tearDown()
    {
        window = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupViewController()
    {
//        let storyboard = UIStoryboard(name: "Main",
//                                      bundle: Bundle.init(for:self)
//        let viewController =
//            storyboard.instantiateViewController(
//                withIdentifier: "MainViewController")
        sut =  MainViewController()
        sut.loadViewIfNeeded()
    }
    
    func loadView()
    {
        RunLoop.current.run(until: Date())
        FBSnapshotVerifyView(sut.view)
    }
    
    // MARK: Tests
    
    func testShouldFetchGistsWhenViewIsLoaded()
    {
        // When
        loadView()
    }
}
