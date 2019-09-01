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
    public var isTokenActive: Bool
    
    public init() {
        AKGFontManager.init()
        self.isTokenActive = DataManager.sharedInstance.isLogin()
    }
    
    public func showLoginView(viewController: UIViewController!) {
        viewController.add(LoginViewController())
    }
    
    public func showFloatingAKGButton(viewController: UIViewController!) {
        viewController.add(FloatingButtonViewController())
    }
    
}
