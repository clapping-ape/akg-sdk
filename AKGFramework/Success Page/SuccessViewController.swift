//
//  SuccessViewController.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 09/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import UIKit

class SuccessViewController: BaseViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var successLabel: UILabel!
    
    var flag: String! = ""
    var textToShow: String! = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        self.successLabel.text = self.textToShow!
    }
    
    init() {
        super.init(nibName: "SuccessViewController", bundle: Bundle(for: SuccessViewController.self))
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    // MARK: - IBActions
    @IBAction func nextButton(_ sender: Any) {
        if flag == "forgot-password" {
            AKGFrameworkManager.sharedInstance.akgDelegate?.akgForgotPasswordSuccess!()
            self.remove()
        }
        if flag == "register" {
            self.remove()
            self.getTopMostViewController()?.add(LoginViewController())
        }
    }
}
