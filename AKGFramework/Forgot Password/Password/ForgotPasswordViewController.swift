//
//  ForgotPasswordViewController.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 15/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: BaseViewController, ForgotPasswordView {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var verifyPasswordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    var phoneNumber: String! = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ForgotPasswordPresenter.sharedInstance.attachView(view: self)
    }
    
    init() {
        super.init(nibName: "ForgotPasswordViewController", bundle: Bundle(for: ForgotPasswordViewController.self))
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - IBActions
    @IBAction func backgroundTapGesture(_ sender: Any) {
        self.passwordTextField.resignFirstResponder()
        self.verifyPasswordTextField.resignFirstResponder()
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.remove()
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if self.passwordTextField.text == "" {
            self.basicAlertView(title: "", message: "Password can't be blank.", successBlock: {})
            
        }
        else if self.verifyPasswordTextField.text == "" {
            self.basicAlertView(title: "", message: "Verify Password can't be blank.", successBlock: {})
            
        }
        else if self.passwordTextField.text != self.verifyPasswordTextField.text {
            self.basicAlertView(title: "", message: "Verify Password didn't match.", successBlock: {})
            
        }
        else{
            if self.phoneNumber == "" {
                self.basicAlertView(title: "", message: "Phone Number Invalid.", successBlock: {})
                
            }else{
                
                ForgotPasswordPresenter.sharedInstance.postResetPasswordAPI(param: [
                    "phone_number": "0\(self.phoneNumber!)",
                    "password": self.passwordTextField.text!,
                    "auth_provider": "akg",
                    "game_provider": "mobile-legends"])
                
            }
        }
    }
    
    
    // MARK: - Presenter Delegate
    internal func startLoading() {
        self.showLoadingIndicator()
    }
    
    internal func finishLoading() {
        self.hideLoadingIndicator()
    }
    
    internal func sendOTPSuccess() {
        
    }
    
    internal func checkOTPSuccess() {
        
    }
    
    internal func updatePasswordSuccess() {
        
        let successView = SuccessViewController()
        successView.textToShow = "Your password already been changed"
        
        self.remove()
        self.getTopMostViewController()?.add(successView)
    }
    
    internal func setErrorMessageFromAPI(errorMessage: String) {
        self.basicAlertView(title: "", message: errorMessage, successBlock: {})
    }

}
