//
//  PhoneLoginViewController.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 09/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import UIKit

class PhoneLoginViewController: BaseViewController {

    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.phoneButton.titleEdgeInsets = UIEdgeInsets.init(top: 4, left: 28, bottom: 4, right: 4)
    }
    
    init() {
        super.init(nibName: "PhoneLoginViewController", bundle: Bundle(for: PhoneLoginViewController.self))

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - IBActions
    @IBAction func backgroundTapGesture(_ sender: Any) {
        self.phoneTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
    }
    
    @IBAction func phoneButton(_ sender: Any) {
    }
    
    @IBAction func registerButton(_ sender: Any) {
        self.present(RegistrationViewController(), animated: true, completion: nil)
    }
    
    @IBAction func forgotPasswordButton(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
