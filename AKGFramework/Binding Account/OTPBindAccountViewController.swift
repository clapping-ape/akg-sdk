//
//  OTPBindAccountViewController.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 06/09/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import UIKit

class OTPBindAccountViewController: BaseViewController, BindAccountView {
    
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var otpTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var otpLabel: UILabel!
    @IBOutlet weak var resendButton: UIButton!
    
    var otpSendStatus: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        BindAccountPresenter.sharedInstance.attachView(view: self)
    }
    
    init() {
        super.init(nibName: "OTPBindAccountViewController", bundle: Bundle(for: OTPBindAccountViewController.self))
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
        self.getTopMostViewController()?.add(BindAccountViewController())
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if self.otpSendStatus == false {
            if self.phoneTextField.text != "" {
                
                BindAccountPresenter.sharedInstance.postSendOTPAPI(param: [
                    "phone_number": "0\(self.phoneTextField.text!)",
                    "auth_provider": "akg",
                    "game_provider": DataManager.sharedInstance.getProvider(),
                    "otp_type": "phone_binding"])
            }else{
                
                self.basicAlertView(title: "", message: "Phone Number can't be blank.", successBlock: {})
            }
        }else{
            if self.otpTextField.text != "" {
                
                BindAccountPresenter.sharedInstance.postCheckOTPAPI(param: [
                    "phone_number": "0\(self.phoneTextField.text!)",
                    "auth_provider": "akg",
                    "game_provider": DataManager.sharedInstance.getProvider(),
                    "otp_type": "phone_binding",
                    "otp_code": self.otpTextField.text!])
            }else{
                
                self.basicAlertView(title: "", message: "OTP's Code can't be blank.", successBlock: {})
            }
        }
    }
    
    @IBAction func resendButton(_ sender: Any) {
        
        BindAccountPresenter.sharedInstance.postSendOTPAPI(param: [
            "phone_number": "0\(self.phoneTextField.text!)",
            "auth_provider": "akg",
            "game_provider": DataManager.sharedInstance.getProvider(),
            "otp_type": "phone_binding"])
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
        let registrationView = VerificationBindAccountViewController()
        registrationView.phoneNumber = self.phoneTextField.text!
        
        self.remove()
        self.getTopMostViewController()?.add(registrationView)
    }
    
    internal func bindAccountSuccess() {
        
    }
    
    internal func setErrorMessageFromAPI(errorMessage: String) {
        self.basicAlertView(title: "", message: errorMessage, successBlock: {})
    }

}
