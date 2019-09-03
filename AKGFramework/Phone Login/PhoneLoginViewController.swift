//
//  PhoneLoginViewController.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 09/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import UIKit

class PhoneLoginViewController: BaseViewController, LoginView, UITextFieldDelegate {

    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneButton: UIButton!
    
    private var authProvider: String! = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        LoginPresenter.sharedInstance.attachView(view: self)
        self.passwordTextField.delegate = self
    }
    
    init() {
        super.init(nibName: "PhoneLoginViewController", bundle: Bundle(for: PhoneLoginViewController.self))
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - TextField Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.loginFunc()
        return true
    }
    
    private func loginFunc() {
        if self.phoneTextField.text == "" {
            self.basicAlertView(title: "", message: "Phone can't be blank.", successBlock: {})
        }
        else if self.passwordTextField.text == "" {
            self.basicAlertView(title: "", message: "Password can't be blank.", successBlock: {})
        }
        else {
            self.authProvider = "akg"
            LoginPresenter.sharedInstance.postLoginAPI(
                param:
                ["phone_number":"0\(self.phoneTextField.text!)",
                    "password": self.passwordTextField.text!,
                    "auth_provider": self.authProvider!,
                    "game_provider": DataManager.sharedInstance.getProvider(),
                    "device_id": UtilityManager.sharedInstance.deviceIdentifier(),
                    "phone_model": UtilityManager.sharedInstance.getDeviceModel(),
                    "operating_system": Constant.OperatingSystem
                ])
        }
    }

    // MARK: - IBActions
    @IBAction func backgroundTapGesture(_ sender: Any) {
        self.phoneTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
    }
    
    @IBAction func phoneButton(_ sender: Any) {
        self.loginFunc()
    }
    
    @IBAction func registerButton(_ sender: Any) {
        self.remove()
        self.getTopMostViewController()?.add(RegistrationViewController())
        
    }
    
    @IBAction func forgotPasswordButton(_ sender: Any) {
        self.remove()
        self.getTopMostViewController()?.add(OTPForgotPasswordViewController())
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.remove()
        self.getTopMostViewController()?.add(LoginViewController())
    }
    
    // MARK: - Presenter Delegate
    internal func startLoading() {
        self.showLoadingIndicator()
    }
    
    internal func finishLoading() {
        self.hideLoadingIndicator()
    }
    
    internal func loginSuccess() {
        DataManager.sharedInstance.setAuthProvider(provider: self.authProvider!)
        self.remove()
    }
    
    internal func setErrorMessageFromAPI(errorMessage: String) {
        self.basicAlertView(title: "", message: errorMessage, successBlock: {})
    }

}
