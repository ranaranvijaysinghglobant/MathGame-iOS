//
//  MainViewControllerStub.swift
//  DigitAdderTests
//
//  Created by Kalyani Chinchane on 03/01/19.
//  Copyright © 2019 globant. All rights reserved.
//

import Foundation
@testable import DigitAdder

class MainViewControllerStub:MainView {
    
    var isUpdateTimeLabelCalled = false
    var isShowAlertTimeUpCalled = false
    var isSetRandomNumberLabelCalled = false
    var isUpdateScoreLabelCalled = false
    
    func updateTimeLabelWith(text: String) {
        isUpdateTimeLabelCalled = true
    }
    
    func showAlertTimeUpWith(finalMessage: String) {
         isShowAlertTimeUpCalled = true
    }
    
    func setRandomNumberLabelWith(text: String) {
        isSetRandomNumberLabelCalled = true
    }
    
    func updateScoreLabelWith(text: String) {
        isUpdateScoreLabelCalled = true
    }
    
    
}
