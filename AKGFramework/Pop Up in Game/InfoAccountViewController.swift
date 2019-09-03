//
//  InfoAccountViewController.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 29/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import UIKit

class InfoAccountViewController: BaseViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var uidTextField: UITextField!
    @IBOutlet weak var changePasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIManager.sharedInstance.currentUserAPI(callBack: { [weak self](user) in
            
            self!.userNameTextField.text = user.attributes?.email! == "" ? user.attributes?.phone_number! : user.attributes?.email!
            self!.uidTextField.text = user.attributes?.uid!
            
        }) { (message) in
            
            self.basicAlertView(title: "", message: message, successBlock: {})
        }
        
        if DataManager.sharedInstance.getAuthProvider() == "akg" {
            self.changePasswordButton.isHidden = false
        }else {
            self.changePasswordButton.isHidden = true
        }
        
    }
    
    init() {
        super.init(nibName: "InfoAccountViewController", bundle: Bundle(for: InfoAccountViewController.self))
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - IBActions
    @IBAction func backButton(_ sender: Any) {
        
        self.remove()
    }

    @IBAction func changePasswordButton(_ sender: Any) {
        
        self.getTopMostViewController()?.add(ChangePasswordViewController())
    }
    
}
