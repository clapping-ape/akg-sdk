//
//  LoginViewController.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 26/07/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import UIKit
import GoogleSignIn
import FBSDKLoginKit

public class LoginViewController: BaseViewController, LoginView, GIDSignInUIDelegate, GIDSignInDelegate {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var googlePlayButton: UIButton!
    @IBOutlet weak var guestButton: UIButton!
    
    private var authProvider: String! = ""
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.facebookButton.titleEdgeInsets = UIEdgeInsets.init(top: 4, left: 32, bottom: 4, right: 4)
        self.googlePlayButton.titleEdgeInsets = UIEdgeInsets.init(top: 4, left: 32, bottom: 4, right: 4)
        self.guestButton.titleEdgeInsets = UIEdgeInsets.init(top: 4, left: 16, bottom: 4, right: 4)
        
        LoginPresenter.sharedInstance.attachView(view: self)
        
    }

    public init() {
        
        super.init(nibName: "LoginViewController", bundle: Bundle(for: LoginViewController.self))
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
//        self.containerView.translatesAutoresizingMaskIntoConstraints = false
//
//        let margins = view.layoutMarginsGuide
//        NSLayoutConstraint.activate([
//            self.containerView.centerYAnchor.constraint(equalTo: margins.centerYAnchor)
//            ])
//
//        if #available(iOS 11, *) {
//            let guide = view.safeAreaLayoutGuide
//            NSLayoutConstraint.activate([
//                self.containerView.centerYAnchor.constraint(equalToSystemSpacingBelow: guide.centerYAnchor, multiplier: 1.0)
//                ])
//
//        } else {
//            let standardSpacing: CGFloat = -44
//            NSLayoutConstraint.activate([
//                self.containerView.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor, constant: standardSpacing)])
//        }
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
//        let userId = user.userID                  // For client-side use only!
//        let idToken = user.authentication.idToken // Safe to send to the server
//        let fullName = user.profile.name
//        let givenName = user.profile.givenName
//        let familyName = user.profile.familyName
//        let email = user.profile.email
        
        
        self.authProvider = "google"
        LoginPresenter.sharedInstance.postSocialMediaLoginAPI(
            param:
            ["access_token": user.authentication.idToken!,
             "auth_provider": self.authProvider!,
             "game_provider": DataManager.sharedInstance.getProvider(),
             "device_id": UtilityManager.sharedInstance.deviceIdentifier(),
             "phone_model": UtilityManager.sharedInstance.getDeviceModel(),
             "operating_system": Constant.OperatingSystem
            ])
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - IBActions
    @IBAction func facebookButton(_ sender: Any) {
        FBSDKLoginManager.init().logIn(withReadPermissions: ["public_profile", "email"], from: self) { (result: FBSDKLoginManagerLoginResult!, error: Error!) in

            if FBSDKAccessToken.current() != nil {
                print("FACEBOOK TOKEN", FBSDKAccessToken.current()!.tokenString!)
                
                self.authProvider = "facebook"
                LoginPresenter.sharedInstance.postSocialMediaLoginAPI(
                    param:
                    ["access_token": FBSDKAccessToken.current()!.tokenString!,
                     "auth_provider": self.authProvider!,
                     "game_provider": DataManager.sharedInstance.getProvider(),
                     "device_id": UtilityManager.sharedInstance.deviceIdentifier(),
                     "phone_model": UtilityManager.sharedInstance.getDeviceModel(),
                     "operating_system": Constant.OperatingSystem
                    ])
            }
        }
    }
    
    @IBAction func googlePlayButton(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    @IBAction func guestButton(_ sender: Any) {
        self.authProvider = "guest"
        LoginPresenter.sharedInstance.postGuestLoginAPI(
            param:
            ["auth_provider": self.authProvider!,
             "game_provider": DataManager.sharedInstance.getProvider(),
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
    
    internal func loginSuccess() {
        DataManager.sharedInstance.setAuthProvider(provider: self.authProvider!)
        self.remove()
    }
    
    internal func setErrorMessageFromAPI(errorMessage: String) {
        self.basicAlertView(title: "", message: errorMessage, successBlock: {})
    }
    
}
