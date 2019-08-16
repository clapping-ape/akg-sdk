//
//  LoginViewController.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 26/07/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import UIKit
import GoogleSignIn

public class LoginViewController: BaseViewController, GIDSignInDelegate, GIDSignInUIDelegate {
    

    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var googlePlayButton: UIButton!
    @IBOutlet weak var guestButton: UIButton!
    @IBOutlet weak var phoneButton: UIButton!
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        self.facebookButton.titleEdgeInsets = UIEdgeInsets.init(top: 4, left: 32, bottom: 4, right: 4)
        self.googlePlayButton.titleEdgeInsets = UIEdgeInsets.init(top: 4, left: 32, bottom: 4, right: 4)
        self.guestButton.titleEdgeInsets = UIEdgeInsets.init(top: 4, left: 28, bottom: 4, right: 4)
        self.phoneButton.titleEdgeInsets = UIEdgeInsets.init(top: 4, left: 28, bottom: 4, right: 4)
    }

    public init() {
        
        super.init(nibName: "LoginViewController", bundle: Bundle(for: LoginViewController.self))
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        DispatchQueue.main.async {
            self.getTopMostViewController()?.add(self)
        }
        
//        GIDSignIn.sharedInstance()?.clientID = "810315591302-licqe3j85mu22s4iqko496l8iiqf0ah2.apps.googleusercontent.com"
//        GIDSignIn.sharedInstance().delegate = self
//        GIDSignIn.sharedInstance().uiDelegate = self
//
//        let url = URL(string: "com.googleusercontent.apps.810315591302-licqe3j85mu22s4iqko496l8iiqf0ah2")
//        UIApplication.shared.open(url!) { (result) in
//            if result {
//                // The URL was delivered successfully!
//            }
//        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - IBActions
    @IBAction func facebookButton(_ sender: Any) {
        
    }
    @IBAction func googlePlayButton(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
        
    }
    @IBAction func guestButton(_ sender: Any) {
        
    }
    @IBAction func phoneButton(_ sender: Any) {

        self.remove()
        self.getTopMostViewController()?.add(PhoneLoginViewController())
        
//        self.present(PhoneLoginViewController(), animated: true, completion: nil)
    }
    
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            // ...
        }
    }
    
    
    public func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
    
    }
    
    public func sign(_ signIn: GIDSignIn!,
                     present viewController: UIViewController!) {
        
        self.present(viewController, animated: true, completion: nil)
        
    }
    
    public func sign(_ signIn: GIDSignIn!,
                     dismiss viewController: UIViewController!) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Presenter Delegate
    internal func startLoading() {
        self.showLoadingIndicator()
    }
    
    internal func finishLoading() {
        self.hideLoadingIndicator()
    }
    
    internal func loginSuccess() {
    }
    
    internal func setErrorMessageFromAPI(errorMessage: String) {
        self.basicAlertView(title: "", message: errorMessage, successBlock: {})
    }
    
}
