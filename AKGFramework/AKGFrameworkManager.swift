//
//  AKGFrameworkManager.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 16/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import Foundation
import UIKit

public class AKGFrameworkManager {
    
    public static let sharedInstance = AKGFrameworkManager()
    public var delegate: UIApplicationDelegate?
    public var signInDelegate: AKGSignInDelegate?
    public var viewController: UIViewController!
    
    public init() {}
    
    public func setProvider(provider: String!) {
        DataManager.sharedInstance.setProvider(token: provider)
    }
    
    public func showSignInView() {
        self.viewController.present(LoginViewController(), animated: true, completion: nil)
    }
    
    func removeAllView() {
        for v in viewController.view.subviews{
            v.removeFromSuperview()
        }
    }
    
}
