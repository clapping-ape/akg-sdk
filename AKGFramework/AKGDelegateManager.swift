//
//  AKGDelegateManager.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 16/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import Foundation
import UIKit
import GoogleSignIn
import AdjustSdk

public class AKGDelegateManager: NSObject, GIDSignInDelegate {
    
    
    public var applicationDelegate: UIApplicationDelegate?
    
    @discardableResult public init(delegate: UIApplicationDelegate, provider: String) {
        super.init()
        
        GIDSignIn.sharedInstance()?.clientID = "810315591302-licqe3j85mu22s4iqko496l8iiqf0ah2.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        
        self.applicationDelegate = delegate
        DataManager.sharedInstance.setProvider(provider: provider)
        
        let adjustConfig = ADJConfig.init(appToken: "y1t3z228xxj4", environment: ADJEnvironmentSandbox)
        Adjust.appDidLaunch(adjustConfig)
    }
    
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//        print("masuk: ", user)
    }
}
