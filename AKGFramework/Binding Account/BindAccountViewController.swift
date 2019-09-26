//
//  BindAccountViewController.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 29/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import UIKit
import GoogleSignIn
import FBSDKLoginKit

class BindAccountViewController: BaseViewController, AccountView, GIDSignInUIDelegate, GIDSignInDelegate {
    

    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var googlePlayButton: UIButton!
    
    private var authProvider: String! = ""
    
    var callbackBindAccountWithPhone:(() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.facebookButton.titleEdgeInsets = UIEdgeInsets.init(top: 4, left: 32, bottom: 4, right: 4)
        self.googlePlayButton.titleEdgeInsets = UIEdgeInsets.init(top: 4, left: 32, bottom: 4, right: 4)
        
        AccountPresenter.sharedInstance.attachView(view: self)
    }
    
    init() {
        super.init(nibName: "BindAccountViewController", bundle: Bundle(for: BindAccountViewController.self))
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        self.authProvider = "google"
        self.callBindAccount(token: user.authentication.idToken!, provider: self.authProvider)
    }
    
    private func signIn(signIn: GIDSignIn!,
                        presentViewController viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    private func signIn(signIn: GIDSignIn!,
                        dismissViewController viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }

    
    // MARK: - IBActions
    @IBAction func facebookButton(_ sender: Any) {
        
        FBSDKLoginManager.init().logIn(withReadPermissions: ["public_profile", "email"], from: self) { (result: FBSDKLoginManagerLoginResult!, error: Error!) in
            
            if FBSDKAccessToken.current() != nil {
                
                self.authProvider = "facebook"
                self.callBindAccount(token: FBSDKAccessToken.current()!.tokenString!, provider: self.authProvider)
                
            }
            
        }
    }
    
    @IBAction func googlePlayButton(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        self.remove()
    }
    
    func callBindAccount(token: String!, provider: String!) {
        AccountPresenter.sharedInstance.postBindAccountAPI(
            param:
            ["access_token": token!,
             "auth_provider": provider!,
             "device_id": UtilityManager.sharedInstance.deviceIdentifier(),
             "phone_model": UtilityManager.sharedInstance.getDeviceModel(),
             "operating_system": Constant.OperatingSystem
            ])
    }
    
    // MARK: - Presenter Delegate
    internal func startLoading() {
        self.showLoadingIndicator()
    }
    
    internal func finishLoading() {
        self.hideLoadingIndicator()
    }
    
    internal func bindAccountSuccess() {
        
        DataManager.sharedInstance.setAuthProvider(provider: self.authProvider!)
        self.callbackBindAccountWithPhone!()
        self.remove()
    }
    
    internal func changePasswordSuccess() {
        
    }
    
    internal func setErrorMessageFromAPI(errorMessage: String) {
        self.basicAlertView(title: "", message: errorMessage, successBlock: {})
    }
    
}
