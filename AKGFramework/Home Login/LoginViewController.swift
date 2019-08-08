//
//  LoginViewController.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 26/07/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import UIKit

public class LoginViewController: BaseViewController, LoginView {

    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var googlePlayButton: UIButton!
    @IBOutlet weak var guestButton: UIButton!
    @IBOutlet weak var phoneButton: UIButton!
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        LoginPresenter.sharedInstance.attachView(view: self)

        self.facebookButton.titleEdgeInsets = UIEdgeInsets.init(top: 4, left: 32, bottom: 4, right: 4)
        self.googlePlayButton.titleEdgeInsets = UIEdgeInsets.init(top: 4, left: 32, bottom: 4, right: 4)
        self.guestButton.titleEdgeInsets = UIEdgeInsets.init(top: 4, left: 28, bottom: 4, right: 4)
        self.phoneButton.titleEdgeInsets = UIEdgeInsets.init(top: 4, left: 28, bottom: 4, right: 4)
    }

    public init() {
        
        super.init(nibName: "LoginViewController", bundle: Bundle(for: LoginViewController.self))
        DispatchQueue.main.async {
            self.getTopMostViewController()?.present(self, animated: true, completion: nil)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - IBActions
    @IBAction func facebookButton(_ sender: Any) {
        
    }
    @IBAction func googlePlayButton(_ sender: Any) {
        
    }
    @IBAction func guestButton(_ sender: Any) {
        
    }
    @IBAction func phoneButton(_ sender: Any) {

        self.present(PhoneLoginViewController(), animated: true, completion: nil)
        
//        LoginPresenter.sharedInstance.postSendOTPAPI(param: ["phone_number": "0812345678",
//                                                             "auth_provider": "phone",
//                                                             "game_provider": "game",
//                                                             "otp_type": "registration"])
    }
    
    
    // MARK: - Presenter Delegate
    internal func startLoading() {
        self.showLoadingIndicator()
    }
    
    internal func finishLoading() {
        self.hideLoadingIndicator()
    }
    
    internal func sendOTPSuccess() {
        self.basicAlertView(title: "SUCCESS", message: "OTP SENT", successBlock: {})
    }
    
    internal func setErrorMessageFromAPI(errorMessage: String) {
        self.basicAlertView(title: "", message: errorMessage, successBlock: {})
    }
    
}
