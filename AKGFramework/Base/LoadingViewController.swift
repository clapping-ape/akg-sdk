//
//  LoadingViewController.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 08/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    
    private lazy var activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        self.view.alpha = 1.0
        
        self.activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.activityIndicator)
        NSLayoutConstraint.activate([
            self.activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) { [weak self] in
            self?.activityIndicator.startAnimating()
        }
    }

}
