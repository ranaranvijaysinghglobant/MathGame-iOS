//
//  ViewController.swift
//  Add1
//
//  Created by Kalyani Chinchane on 10/12/18.
//  Copyright © 2018 globant. All rights reserved.
//

import UIKit

public class MainViewController: UIViewController {
    
    @IBOutlet weak var randomNumbLabel: UILabel!
    @IBOutlet weak var scoreButton: UIButton!
    @IBOutlet weak var timeRemaining: UIButton!
    @IBOutlet weak var inputTextfield: UITextField!
    @IBOutlet weak var statusImgview: UIImageView!
    var presenter: MainViewPresenter?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        inputTextfield?.addTarget(self, action: #selector(textFieldDidChange(textField:)), for:UIControl.Event.editingChanged)
        presenter = MainViewPresenterImpl.init(view:self)
        presenter?.viewDidLoad()
    }
    
    
    @objc func textFieldDidChange(textField:UITextField)
    {
        if inputTextfield?.text?.count ?? 0 < 4
        {
            return
        }
        
        if let result = presenter?.verifyTextChangedforAnswer(input: textField.text!, currentText: randomNumbLabel.text!) {
            statusImgview.isHidden = false
            
            if result {
                statusImgview.image = UIImage.init(named: "like")
            }
            else{
                statusImgview.image = UIImage.init(named: "unlike")
            }
            self.inputTextfield?.text = ""
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.statusImgview.isHidden = true
            }
        }
    }
}


extension MainViewController:MainView{
    
    func showAlertTimeUpWith(finalMessage:String) {
        let alertController = UIAlertController(title: "Time Up!", message:finalMessage , preferredStyle: .alert)
        
        let restartAction = UIAlertAction(title: "Restart", style: UIAlertAction.Style.default){ (_) in
            self.presenter?.resetTimer()
        }
        alertController.addAction(restartAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func updateTimeLabelWith(text:String)
    {
        timeRemaining?.setTitle(text, for: .normal)
    }
    
    func updateScoreLabelWith(text:String)
    {
        scoreButton?.setTitle(text, for: .normal)
    }
    
    func setRandomNumberLabelWith(text:String)
    {
        randomNumbLabel?.text = text
    }
    
}

