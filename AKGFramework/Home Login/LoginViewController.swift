//
//  LoginViewController.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 26/07/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import UIKit

public class LoginViewController: BaseViewController {
    

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
        
//        DispatchQueue.main.async {
//            self.getTopMostViewController()?.add(self)
//        }
        
        
//        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    
//    private func signIn(signIn: GIDSignIn!,
//                presentViewController viewController: UIViewController!) {
//        self.present(viewController, animated: true, completion: nil)
//    }
    
    // Dismiss the "Sign in with Google" view
//    private func signIn(signIn: GIDSignIn!,
//                dismissViewController viewController: UIViewController!) {
//        self.dismiss(animated: true, completion: nil)
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - IBActions
    @IBAction func facebookButton(_ sender: Any) {
        
        self.basicAlertView(title: "Sorry", message: "This feature is not yet ready.", successBlock: {})
    }
    @IBAction func googlePlayButton(_ sender: Any) {
//        GIDSignIn.sharedInstance().signIn()
        
        self.basicAlertView(title: "Sorry", message: "This feature is not yet ready.", successBlock: {})
    }
    @IBAction func guestButton(_ sender: Any) {
        AKGFrameworkManager.sharedInstance.akgDelegate?.akgUserDidAllowed?()
    }
    @IBAction func phoneButton(_ sender: Any) {

        self.remove()
        self.getTopMostViewController()?.add(PhoneLoginViewController())
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
