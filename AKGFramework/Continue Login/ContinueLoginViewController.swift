//
//  ContinueLoginViewController.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 04/09/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import UIKit

class ContinueLoginViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    init() {
        super.init(nibName: "ContinueLoginViewController", bundle: Bundle(for: ContinueLoginViewController.self))
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
