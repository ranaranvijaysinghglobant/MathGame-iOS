//
//  Utility.swift
//  Add1
//
//  Created by Kalyani Chinchane on 10/12/18.
//  Copyright © 2018 globant. All rights reserved.
//

import Foundation

public class Utility {
    
    private init() {}
    static var sharedInstance =  Utility()
    var score:Int = 0
    
    func getScore() -> Int {
        return score
    }
    
    func generateRandomNumber() -> String
    {
        var result:String = ""
        
        for _ in 1...4
        {
            let digit = Int.random(in: 1..<9)
            
            result += "\(digit)"
        }
        
        return result
    }
    
    func resetScore(){
        score = 0 
    }
    
    func verifyAnswerfor(input:Int,numbers:Int) -> Bool {
        var isCorrect:Bool = false
        
        if(input - numbers == 1111)
        {
            print("Correct!")
            score += 1
            isCorrect = true
        }
        else
        {
            print("Incorrect!")
            if(score > 0) {
                score -= 1
            }
        }
        return isCorrect
    }
}
