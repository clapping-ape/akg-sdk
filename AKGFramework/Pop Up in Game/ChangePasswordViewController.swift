//
//  ChangePasswordViewController.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 03/09/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import UIKit

class ChangePasswordViewController: BaseViewController, AccountView {

    @IBOutlet weak var oldPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var verifyNewPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AccountPresenter.sharedInstance.attachView(view: self)
    }
    
    init() {
        super.init(nibName: "ChangePasswordViewController", bundle: Bundle(for: ChangePasswordViewController.self))
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func nextButton(_ sender: Any) {
        if (self.oldPasswordTextField.text == "" || self.newPasswordTextField.text == "" || self.verifyNewPasswordTextField.text == "") {
            self.basicAlertView(title: "", message: "Fields must not be empty.", successBlock: {})
        }
        else if (self.newPasswordTextField.text != self.verifyNewPasswordTextField.text) {
            self.basicAlertView(title: "", message: "Verify new password did not match.", successBlock: {})
        }
        else
        {
            AccountPresenter.sharedInstance.postResetPasswordAPI(
                param:
                ["old_password": self.oldPasswordTextField.text!,
                 "password": self.newPasswordTextField.text!,
                 "password_confirmation": self.verifyNewPasswordTextField.text!
                ])
        }
    }
    
    // MARK: - Presenter Delegate
    internal func startLoading() {
        self.showLoadingIndicator()
    }
    
    internal func finishLoading() {
        self.hideLoadingIndicator()
    }
    
    internal func bindAccountSuccess() {
    }
    
    internal func changePasswordSuccess() {
        
        self.basicAlertView(title: "", message: "Your password changed successfully.", successBlock: {self.remove()})
    }
    
    internal func setErrorMessageFromAPI(errorMessage: String) {
    }
    
}
