//
//  RegistrationViewController.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 09/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var otpTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var otpLabel: UILabel!
    @IBOutlet weak var resendButton: UIButton!
    
    var otpSendStatus: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    init() {
        super.init(nibName: "RegistrationViewController", bundle: Bundle(for: RegistrationViewController.self))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - IBActions
    @IBAction func backgroundTapGesture(_ sender: Any) {
        self.phoneTextField.resignFirstResponder()
        self.otpTextField.resignFirstResponder()
    }

    @IBAction func nextButton(_ sender: Any) {
        if self.otpSendStatus == false {
            self.otpSendStatus = true
            self.otpLabel.isHidden = false
            self.otpTextField.isHidden = false
            self.resendButton.isHidden = false
            self.nextButton.setTitle("Next", for: .normal)
        }else{
            
            self.otpSendStatus = false
            self.otpLabel.isHidden = true
            self.otpTextField.isHidden = true
            self.resendButton.isHidden = true
            self.nextButton.setTitle("Send OTP", for: .normal)
        }
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
