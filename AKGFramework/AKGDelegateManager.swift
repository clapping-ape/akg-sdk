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
import FBSDKCoreKit

public class AKGDelegateManager: NSObject {
    
    
    public var applicationDelegate: UIApplicationDelegate?
    
    @discardableResult public init(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey: Any]?, delegate: UIApplicationDelegate, provider: String) {
        super.init()
        
        GIDSignIn.sharedInstance()?.clientID = "138197356819-tstivvjlmv6jk7q8e4jm7l1661eqlrme.apps.googleusercontent.com"
        
        FBSDKApplicationDelegate.sharedInstance()?.application(application, didFinishLaunchingWithOptions: launchOptions)
        FBSDKSettings.setAppID("2116421908480837")
        FBSDKSettings.setDisplayName("AKG Frameworks")
        
        self.applicationDelegate = delegate
        DataManager.sharedInstance.setProvider(provider: provider)
        
        self.configAdjust()
    }
    
    private func configAdjust() {
        APIManager.sharedInstance.sdkConfigAPI(callBack: { (adjust) in
            if adjust != nil {
                DataManager.sharedInstance.setAdjustConfig(config: adjust!)
                
                let adjustConfig = ADJConfig.init(appToken: (adjust?.app_token!)!, environment: ADJEnvironmentSandbox)
                Adjust.appDidLaunch(adjustConfig)
            }
        }) { (message) in
            
        }
    }
}
