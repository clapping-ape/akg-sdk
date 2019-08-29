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
        static let Login = "/auth/login"
        static let SocMedLogin = "/auth/provider/login"
        static let CurrentUser = "/auth/current_user"
        static let GuestLogin = "/auth/guest/login"
        static let SendOTP = "/auth/signup/send_otp"
        static let CheckOTP = "/auth/signup/check_otp"
        static let SignUp = "/auth/signup"
        static let UpdatePassword = "/auth/update_password"
        static let BindAccount = "/account/binding"
    }
    
    struct Notification {
        static let googleSignIn = "googleSignInNotification"
    }
    
    static let LocaleIdentifier = "id_ID"
    static let OperatingSystem = "ios"
    
    static let BaseURL = Domains.Development
    static let RouteLogin = Routes.Login
    static let RouteSocMedLogin = Routes.SocMedLogin
    static let RouteCurrentUser = Routes.CurrentUser
    static let RouteGuestLogin = Routes.GuestLogin
    static let RouteSendOTP = Routes.SendOTP
    static let RouteCheckOTP = Routes.CheckOTP
    static let RouteSignUp = Routes.SignUp
    static let RouteUpdatePassword = Routes.UpdatePassword
    static let RouteBindAccount = Routes.BindAccount
    
}
