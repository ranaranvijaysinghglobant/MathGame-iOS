//
//  MainViewPresenter.swift
//  DigitAdder
//
//  Created by Kalyani Chinchane on 14/12/18.
//  Copyright © 2018 globant. All rights reserved.
//

import Foundation

protocol MainView: class {
    func updateTimeLabelWith(text:String)
    func showAlertTimeUpWith(finalMessage:String)
    func setRandomNumberLabelWith(text:String)
    func updateScoreLabelWith(text:String)
}

protocol MainViewPresenter{
    func viewDidLoad()
    func resetTimer()
    func getTimeLeftString() -> String
    func verifyTextChangedforAnswer(input:String,currentText:String) -> Bool
}
class MainViewPresenterImpl: MainViewPresenter{
    
   fileprivate var view: MainView?
    var timer:Timer?
    var seconds:Int = 60    
    
    
    init(view: MainView) {
        self.view = view
    }
    
    func viewDidLoad() {
        view?.setRandomNumberLabelWith(text: "\(Utility.sharedInstance.generateRandomNumber())")
        view?.updateScoreLabelWith(text: "\(Utility.sharedInstance.getScore())")
        resetTimer()
    }
    
    func resetTimer() {
        if(timer == nil)
        {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector:#selector(onUpdateTimer), userInfo:nil, repeats:true)
        }
    }
    
    @objc func onUpdateTimer() -> Void
    {
      
        if(seconds > 0 && seconds <= 60)
        {
            seconds -= 1
            view?.updateTimeLabelWith(text: getTimeLeftString())
        }
        else if(seconds == 0)
        {
            if(timer != nil)
            {
                timer!.invalidate()
                timer = nil
                
                let score = Utility.sharedInstance.getScore()
                var finalMessage = "Your time is up! You got a score of: \(score) points.Better luck next time."
                if score > 0 {
                    
                    finalMessage = "Your time is up! You got a score of: \(score) points. Very good"
                }
                
                seconds = 60
                Utility.sharedInstance.resetScore()
                view?.showAlertTimeUpWith(finalMessage: finalMessage)
                view?.updateTimeLabelWith(text: getTimeLeftString())
                view?.updateScoreLabelWith(text: "\(Utility.sharedInstance.getScore())")
                view?.setRandomNumberLabelWith(text: "\(Utility.sharedInstance.generateRandomNumber())")
                
            }
        }
    }
    
    func getTimeLeftString() -> String {
        let min:Int = (seconds / 60) % 60
        let sec:Int = seconds % 60
        let min_p:String = String(format: "%02d", min)
        let sec_p:String = String(format: "%02d", sec)
        return "\(min_p):\(sec_p)"
    }
    
    func verifyTextChangedforAnswer(input:String,currentText:String) -> Bool{
        var result = false
        
        if let numbers = Int(currentText),
            let input   = Int(input)
        {
            result = Utility.sharedInstance.verifyAnswerfor(input: input, numbers: numbers)
            
        }
        
        view?.setRandomNumberLabelWith(text:"\(Utility.sharedInstance.generateRandomNumber())" )
        view?.updateScoreLabelWith(text: "\(Utility.sharedInstance.getScore())")
        
        return result
        
    }
    
}
