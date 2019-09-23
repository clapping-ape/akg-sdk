//
//  ContinueLoginViewController.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 04/09/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import UIKit

class ContinueLoginViewController: BaseViewController {

    private var countDown = 5
    @IBOutlet weak var countDownButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCountDown), userInfo: nil, repeats: true)

    }
    
    init() {
        super.init(nibName: "ContinueLoginViewController", bundle: Bundle(for: ContinueLoginViewController.self))
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func updateCountDown() {
        if(countDown > 0) {
            self.countDownButton.setTitle("Continue in \(countDown)s", for: .normal)
            countDown = countDown - 1
        } else {
            self.remove()
        }
    }

    @IBAction func countDownButton(_ sender: Any) {
        self.remove()
    }
    
    @IBAction func chooseAccountButton(_ sender: Any) {
        self.remove()
        self.getTopMostViewController()?.add(LoginViewController())
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
