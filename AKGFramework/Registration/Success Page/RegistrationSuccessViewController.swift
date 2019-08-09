//
//  RegistrationSuccessViewController.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 09/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import UIKit

class RegistrationSuccessViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var successLabel: UILabel!
    
    var phoneNumber: String! = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        self.successLabel.text = "Your account with number +62 \(self.phoneNumber!) already been made"
    }
    
    init() {
        super.init(nibName: "RegistrationSuccessViewController", bundle: Bundle(for: RegistrationSuccessViewController.self))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    // MARK: - IBActions
    @IBAction func nextButton(_ sender: Any) {
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
    }
}
