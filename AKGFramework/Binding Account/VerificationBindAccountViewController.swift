//
//  VerificationBindAccountViewController.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 12/09/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import UIKit

class VerificationBindAccountViewController: BaseViewController, BindAccountView {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var verifyPasswordTextField: UITextField!
    
    var phoneNumber: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        BindAccountPresenter.sharedInstance.attachView(view: self)
    }
    
    init() {
        super.init(nibName: "VerificationBindAccountViewController", bundle: Bundle(for: VerificationBindAccountViewController.self))
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

    @IBAction func nextButton(_ sender: Any) {
        
        if self.passwordTextField.text == "" || self.verifyPasswordTextField.text == "" {
            self.basicAlertView(title: "", message: "Password can't be empty.", successBlock: {})
        }
        else if  self.passwordTextField.text != self.verifyPasswordTextField.text {
            self.basicAlertView(title: "", message: "Verify password did not match.", successBlock: {})
        }
        else {
            
            BindAccountPresenter.sharedInstance.postBindAccountAPI(param: [
                "phone_number": "0\(self.phoneNumber)",
                "password": self.passwordTextField.text!,
                "device_id": UtilityManager.sharedInstance.deviceIdentifier(),
                "phone_model": UtilityManager.sharedInstance.getDeviceModel(),
                "operating_system": "iOS"])
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
    
    internal func bindAccountSuccess() {
        DataManager.sharedInstance.setAuthProvider(provider: "akg")
        self.basicAlertView(title: "", message: "Phone Binding success.") {
            self.remove()
        }
    }
    
    internal func setErrorMessageFromAPI(errorMessage: String) {
        self.basicAlertView(title: "", message: errorMessage, successBlock: {})
    }

}
