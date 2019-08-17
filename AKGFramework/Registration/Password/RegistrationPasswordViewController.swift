//
//  RegistrationPasswordViewController.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 09/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import UIKit

class RegistrationPasswordViewController: BaseViewController, RegisterView {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var verifyPasswordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    var phoneNumber: String! = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RegisterPresenter.sharedInstance.attachView(view: self)
    }
    
    init() {
        super.init(nibName: "RegistrationPasswordViewController", bundle: Bundle(for: RegistrationPasswordViewController.self))
        
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
        self.getTopMostViewController()?.add(RegistrationViewController())
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
                
                RegisterPresenter.sharedInstance.postSignUpAPI(param: [
                    "phone_number": "0\(self.phoneNumber!)",
                    "password": self.passwordTextField.text!,
                    "auth_provider": "akg",
                    "game_provider": "mobile-legends",
                    "device_id": UtilityManager.sharedInstance.deviceIdentifier(),
                    "phone_model": UtilityManager.sharedInstance.getDeviceModel(),
                    "operating_system": "iOS"])
                
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
    
    internal func signUpSuccess() {
        
        let successView = SuccessViewController()
        successView.textToShow = "Your account with number +62 \(self.phoneNumber!) already been made"
        successView.flag = "register"
        self.remove()
        self.getTopMostViewController()?.add(successView)
    }
    
    internal func setErrorMessageFromAPI(errorMessage: String) {
        self.basicAlertView(title: "", message: errorMessage, successBlock: {})
    }
    
}
