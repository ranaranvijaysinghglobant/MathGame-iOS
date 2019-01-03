//
//  MainPresenterTest.swift
//  DigitAdderTests
//
//  Created by Kalyani Chinchane on 03/01/19.
//  Copyright © 2019 globant. All rights reserved.
//

import XCTest
@testable import DigitAdder

class MainPresenterTest: XCTestCase {

    let view = MainViewControllerStub()
    var presenter:MainViewPresenterImpl?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        presenter = MainViewPresenterImpl.init(view: view)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewDidLoad() {
        presenter?.viewDidLoad()
        XCTAssertTrue(view.isSetRandomNumberLabelCalled)
        XCTAssertTrue(view.isUpdateScoreLabelCalled)
    }
    
    func testResetTimer(){
        presenter?.resetTimer()
        XCTAssertNotNil(presenter?.timer)
    }

}
