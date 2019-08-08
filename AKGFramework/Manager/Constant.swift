//
//  Constant.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 09/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import Foundation

struct Constant {
    
    private struct Domains {
        static let Development = "https://api-akg.clapping.club"
        static let Production = "https://api-akg.akggames.com"
    }
    
    private struct Routes {
        static let SendOTP = "/auth/signup/send_otp"
    }
    
    struct Notification {
        static let googleSignIn = "googleSignInNotification"
    }
    
    static let LocaleIdentifier = "id_ID"
    
    static let BaseURL = Domains.Development
    static let RouteSendOTP = Routes.SendOTP
    
}
