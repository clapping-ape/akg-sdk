//
//  RegistrationViewController.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 09/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import UIKit

class RegistrationViewController: BaseViewController, RegisterView {
    
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var otpTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var otpLabel: UILabel!
    @IBOutlet weak var resendButton: UIButton!
    
    var otpSendStatus: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        RegisterPresenter.sharedInstance.attachView(view: self)
    }
    
    init() {
        super.init(nibName: "RegistrationViewController", bundle: Bundle(for: RegistrationViewController.self))
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - IBActions
    @IBAction func backgroundTapGesture(_ sender: Any) {
        self.phoneTextField.resignFirstResponder()
        self.otpTextField.resignFirstResponder()
    }

    @IBAction func backButton(_ sender: Any) {
        self.remove()
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if self.otpSendStatus == false {
            if self.phoneTextField.text != "" {
                
                RegisterPresenter.sharedInstance.postSendOTPAPI(param: [
                    "phone_number": "0\(self.phoneTextField.text!)",
                    "auth_provider": "akg",
                    "game_provider": "mobile-legends",
                    "otp_type": "registration"])
            }else{
                
                self.basicAlertView(title: "", message: "Phone Number can't be blank.", successBlock: {})
            }
        }else{
            if self.otpTextField.text != "" {
                
                RegisterPresenter.sharedInstance.postCheckOTPAPI(param: [
                    "phone_number": "0\(self.phoneTextField.text!)",
                    "auth_provider": "akg",
                    "game_provider": "mobile-legends",
                    "otp_type": "registration",
                    "otp_code": self.otpTextField.text!])
            }else{
                
                self.basicAlertView(title: "", message: "OTP's Code can't be blank.", successBlock: {})
            }
        }
    }
    
    @IBAction func resendButton(_ sender: Any) {
        
        RegisterPresenter.sharedInstance.postSendOTPAPI(param: [
            "phone_number": "0\(self.phoneTextField.text!)",
            "auth_provider": "akg",
            "game_provider": "mobile-legends",
            "otp_type": "registration"])
    }
    
    // MARK: - Presenter Delegate
    internal func startLoading() {
        self.showLoadingIndicator()
    }
    
    internal func finishLoading() {
        self.hideLoadingIndicator()
    }
    
    internal func sendOTPSuccess() {
        self.otpSendStatus = true
        self.otpLabel.isHidden = false
        self.otpTextField.isHidden = false
        self.resendButton.isHidden = false
        self.nextButton.setTitle("Next", for: .normal)
        
    }
    
    internal func checkOTPSuccess() {
        let registrationView = RegistrationPasswordViewController()
        registrationView.phoneNumber = self.phoneTextField.text!
        
        self.remove()
        self.getTopMostViewController()?.add(registrationView)
    }
    
    internal func signUpSuccess() {
        
    }
    
    internal func setErrorMessageFromAPI(errorMessage: String) {
        self.basicAlertView(title: "", message: errorMessage, successBlock: {})
    }

}
