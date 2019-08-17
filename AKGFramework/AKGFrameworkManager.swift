//
//  AKGFrameworkManager.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 16/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import Foundation
import UIKit

@objc public protocol AKGDelegate:class {
    func akgUserDidAllowed()
    @objc optional func akgForgotPasswordSuccess()
}

public class AKGFrameworkManager {
    
    public static let sharedInstance = AKGFrameworkManager()
    public var akgDelegate: AKGDelegate?
    public var viewController: UIViewController!
    
    public init() {}
    
    public func showLoginView() {
//        self.viewController.present(LoginViewController(), animated: true, completion: nil)
        self.viewController.add(LoginViewController())
    }
    
}
