//
//  PopUpViewController.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 21/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import UIKit

class PopUpViewController: BaseViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    var titleText: String! = ""
    var contentText: String! = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = self.titleText!
        self.contentLabel.text = self.contentText!
    }
    
    init() {
        super.init(nibName: "PopUpViewController", bundle: Bundle(for: PopUpViewController.self))
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - IBActions
    @IBAction func nextButton(_ sender: Any) {
        
        self.remove()
    }
}
