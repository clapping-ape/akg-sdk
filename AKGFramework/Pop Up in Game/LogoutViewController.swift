//
//  LogoutViewController.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 21/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import UIKit

class LogoutViewController: BaseViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    init() {
        super.init(nibName: "LogoutViewController", bundle: Bundle(for: LogoutViewController.self))
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - IBActions
    @IBAction func backButton(_ sender: Any) {
        
        self.remove()
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        AKGFrameworkManager.sharedInstance.akgDelegate?.akgUserDidLoggedOut!()
        self.remove()
    }
}
