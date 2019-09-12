//
//  APIManager.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 09/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import Foundation
import UIKit
import AdjustSdk

class APIManager {
    
    private init() {}
    static let sharedInstance = APIManager()
    
    func loginAPI(param:[String:Any]!, callBack: @escaping (Login) -> Void, message: @escaping (String) -> Void) {
        
        NetworkRequest.sharedInstance.callAPI(
            method: "POST",
            route: Constant.RouteLogin,
            withAuthorization: false,
            params: param,
            successBlock: { (responseObject: [String : Any]) in
                
                Adjust.trackEvent(ADJEvent.init(eventToken: "gxl8cb"))
                
                let login = Login.init(data: responseObject)
                callBack(login)
                
        }) { (errorMessage: String) in
            message(errorMessage)
        }
        
    }
    
    func socialMediaLoginAPI(param:[String:Any]!, callBack: @escaping (Login) -> Void, message: @escaping (String) -> Void) {
        
        NetworkRequest.sharedInstance.callAPI(
            method: "POST",
            route: Constant.RouteSocMedLogin,
            withAuthorization: false,
            params: param,
            successBlock: { (responseObject: [String : Any]) in
                
                Adjust.trackEvent(ADJEvent.init(eventToken: "gxl8cb"))
                
                let login = Login.init(data: responseObject)
                callBack(login)
                
        }) { (errorMessage: String) in
            message(errorMessage)
        }
        
    }
    
    func currentUserAPI(callBack: @escaping (User) -> Void, message: @escaping (String) -> Void) {
        
        NetworkRequest.sharedInstance.callAPI(
            method: "GET",
            route: Constant.RouteCurrentUser,
            withAuthorization: true,
            params: nil,
            successBlock: { (responseObject: [String : Any]) in
                
                let user = User.init(data: responseObject)
                callBack(user)
                
        }) { (errorMessage: String) in
            message(errorMessage)
        }
        
    }
    
    func guestLoginAPI(param:[String:Any]!, callBack: @escaping (Login) -> Void, message: @escaping (String) -> Void) {
        
        NetworkRequest.sharedInstance.callAPI(
            method: "POST",
            route: Constant.RouteGuestLogin,
            withAuthorization: false,
            params: param,
            successBlock: { (responseObject: [String : Any]) in
                
                Adjust.trackEvent(ADJEvent.init(eventToken: "gxl8cb"))
                
                let login = Login.init(data: responseObject)
                callBack(login)
                
        }) { (errorMessage: String) in
            message(errorMessage)
        }
        
    }
    
    func sendOTPAPI(param:[String:Any]!, callBack: @escaping (Meta) -> Void, message: @escaping (String) -> Void) {
        
        NetworkRequest.sharedInstance.callAPI(
            method: "POST",
            route: Constant.RouteSendOTP,
            withAuthorization: false,
            params: param,
            successBlock: { (responseObject: [String : Any]) in
                
                let meta = Meta.init(data: responseObject)
                callBack(meta)
                
        }) { (errorMessage: String) in
            message(errorMessage)
        }
        
    }
    
    func checkOTPAPI(param:[String:Any]!, callBack: @escaping (Meta) -> Void, message: @escaping (String) -> Void) {
        
        NetworkRequest.sharedInstance.callAPI(
            method: "POST",
            route: Constant.RouteCheckOTP,
            withAuthorization: false,
            params: param,
            successBlock: { (responseObject: [String : Any]) in
                
                let meta = Meta.init(data: responseObject)
                callBack(meta)
                
        }) { (errorMessage: String) in
            message(errorMessage)
        }
        
    }
    
    func signUpAPI(param:[String:Any]!, callBack: @escaping (Meta) -> Void, message: @escaping (String) -> Void) {
        
        NetworkRequest.sharedInstance.callAPI(
            method: "POST",
            route: Constant.RouteSignUp,
            withAuthorization: false,
            params: param,
            successBlock: { (responseObject: [String : Any]) in
                
                Adjust.trackEvent(ADJEvent.init(eventToken: "7gzpmk"))
                
                let meta = Meta.init(data: responseObject)
                callBack(meta)
                
        }) { (errorMessage: String) in
            
            Adjust.trackEvent(ADJEvent.init(eventToken: "nr3ny5"))
            
            message(errorMessage)
        }
        
    }
    
    func updatePasswordAPI(param:[String:Any]!, callBack: @escaping (Meta) -> Void, message: @escaping (String) -> Void) {
        
        NetworkRequest.sharedInstance.callAPI(
            method: "POST",
            route: Constant.RouteUpdatePassword,
            withAuthorization: false,
            params: param,
            successBlock: { (responseObject: [String : Any]) in
                
                let meta = Meta.init(data: responseObject)
                callBack(meta)
                
        }) { (errorMessage: String) in
            message(errorMessage)
        }
        
    }
    
    func changePasswordAPI(param:[String:Any]!, callBack: @escaping (Meta) -> Void, message: @escaping (String) -> Void) {
        
        NetworkRequest.sharedInstance.callAPI(
            method: "PUT",
            route: Constant.RouteChangePassword,
            withAuthorization: true,
            params: param,
            successBlock: { (responseObject: [String : Any]) in
                
                let meta = Meta.init(data: responseObject)
                callBack(meta)
                
        }) { (errorMessage: String) in
            message(errorMessage)
        }
        
    }
    
    func bindAccountAPI(param:[String:Any]!, callBack: @escaping (Login) -> Void, message: @escaping (String) -> Void) {
        
        NetworkRequest.sharedInstance.callAPI(
            method: "POST",
            route: Constant.RouteBindAccount,
            withAuthorization: true,
            params: param,
            successBlock: { (responseObject: [String : Any]) in
                
                let login = Login.init(data: responseObject)
                callBack(login)
                
        }) { (errorMessage: String) in
            message(errorMessage)
        }
        
    }
    
    func phoneBindingAPI(param:[String:Any]!, callBack: @escaping (Login) -> Void, message: @escaping (String) -> Void) {
        
        NetworkRequest.sharedInstance.callAPI(
            method: "POST",
            route: Constant.RoutePhoneBinding,
            withAuthorization: true,
            params: param,
            successBlock: { (responseObject: [String : Any]) in
                
                let login = Login.init(data: responseObject)
                callBack(login)
                
        }) { (errorMessage: String) in
            message(errorMessage)
        }
        
    }
}
