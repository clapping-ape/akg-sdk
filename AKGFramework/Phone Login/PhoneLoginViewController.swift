//
//  PhoneLoginViewController.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 09/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import UIKit

class PhoneLoginViewController: BaseViewController, LoginView {

    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        LoginPresenter.sharedInstance.attachView(view: self)
        self.phoneButton.titleEdgeInsets = UIEdgeInsets.init(top: 4, left: 28, bottom: 4, right: 4)
    }
    
    init() {
        super.init(nibName: "PhoneLoginViewController", bundle: Bundle(for: PhoneLoginViewController.self))

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - IBActions
    @IBAction func backgroundTapGesture(_ sender: Any) {
        self.phoneTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
    }
    
    @IBAction func phoneButton(_ sender: Any) {
        if self.phoneTextField.text == "" {
            self.basicAlertView(title: "", message: "Phone can't be blank.", successBlock: {})
        }
        else if self.passwordTextField.text == "" {
            self.basicAlertView(title: "", message: "Password can't be blank.", successBlock: {})
        }
        else {
            LoginPresenter.sharedInstance.postLoginAPI(
                param:
                ["phone_number":"0\(self.phoneTextField.text!)",
                "password": self.passwordTextField.text!,
                "auth_provider": "akg",
                "game_provider": "mobile-legends",
                "device_id": UtilityManager.sharedInstance.deviceIdentifier(),
                "phone_model": UtilityManager.sharedInstance.getDeviceModel(),
                "operating_systme": "iOS"
                ])
        }
    }
    
    @IBAction func registerButton(_ sender: Any) {
        self.present(RegistrationViewController(), animated: true, completion: nil)
    }
    
    @IBAction func forgotPasswordButton(_ sender: Any) {
        self.present(OTPForgotPasswordViewController(), animated: true, completion: nil)
    }
    
    
    // MARK: - Presenter Delegate
    internal func startLoading() {
        self.showLoadingIndicator()
    }
    
    internal func finishLoading() {
        self.hideLoadingIndicator()
    }
    
    internal func loginSuccess() {
        self.basicAlertView(title: "SUCCESS", message: "Logged In.", successBlock: {})
    }
    
    internal func setErrorMessageFromAPI(errorMessage: String) {
        self.basicAlertView(title: "", message: errorMessage, successBlock: {})
    }

}
