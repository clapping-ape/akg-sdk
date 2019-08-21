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
    @objc optional func akgUserDidAllowed()
    @objc optional func akgForgotPasswordSuccess()
    @objc optional func akgUserDidLoggedOut()
}

public class AKGFrameworkManager {
    
    public static let sharedInstance = AKGFrameworkManager()
    public var akgDelegate: AKGDelegate?
    
    public init() {
        AKGFontManager.init()
    }
    
    public func showLoginView(viewController: UIViewController!) {
//        self.viewController.present(LoginViewController(), animated: true, completion: nil)
        viewController.add(LoginViewController())
    }
    
    public func showFloatingAKGButton(viewController: UIViewController!) {
        viewController.add(FloatingButtonViewController())
    }
    
}
