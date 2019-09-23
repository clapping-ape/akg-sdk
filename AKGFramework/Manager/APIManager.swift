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
    
    func trackEventWithName(name: String!) {
        let configAdjust = DataManager.sharedInstance.getAdjustConfig()
        let adjustEventList = configAdjust.events
        for event in adjustEventList! {
            if event.name! == name {
                Adjust.trackEvent(ADJEvent.init(eventToken: event.token!))
                break
            }
        }
        
    }
    
    func loginAPI(param:[String:Any]!, callBack: @escaping (Login) -> Void, message: @escaping (String) -> Void) {
        
        NetworkRequest.sharedInstance.callAPI(
            method: "POST",
            route: Constant.RouteLogin,
            withAuthorization: false,
            params: param,
            successBlock: { (responseObject: [String : Any]) in
                
                self.trackEventWithName(name: "login")
                
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
                
                self.trackEventWithName(name: "login")
                
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
                
                self.trackEventWithName(name: "login")
                
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
                
                self.trackEventWithName(name: "register_success")
                
                let meta = Meta.init(data: responseObject)
                callBack(meta)
                
        }) { (errorMessage: String) in
            
            self.trackEventWithName(name: "register_failed")
            
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
    
    func paymentAPI(param:[String:Any]!, callBack: @escaping (Login) -> Void, message: @escaping (String) -> Void) {
        
        NetworkRequest.sharedInstance.callAPI(
            method: "POST",
            route: Constant.RoutePayment,
            withAuthorization: true,
            params: param,
            successBlock: { (responseObject: [String : Any]) in
                
                let login = Login.init(data: responseObject)
                callBack(login)
                
        }) { (errorMessage: String) in
            message(errorMessage)
        }
        
    }
    
    func sdkConfigAPI(callBack: @escaping (ConfigAdjust?) -> Void, message: @escaping (String) -> Void) {
        
        NetworkRequest.sharedInstance.callAPI(
            method: "GET",
            route: Constant.RouteSDKConfig+DataManager.sharedInstance.getProvider(),
            withAuthorization: true,
            params: nil,
            successBlock: { (responseObject: [String : Any]) in
                
                let adjustData = responseObject["adjust"] as? [String:Any] ?? nil
                if adjustData != nil {
                    let adjust = ConfigAdjust.init(data: adjustData!)
                    callBack(adjust)
                }else{
                    callBack(nil)
                }
                
        }) { (errorMessage: String) in
            message(errorMessage)
        }
        
    }
    
    func productListAPI(callBack: @escaping ([Product]) -> Void, message: @escaping (String) -> Void) {
        
        NetworkRequest.sharedInstance.callAPI(
            method: "GET",
            route: Constant.RouteProductList+DataManager.sharedInstance.getProvider(),
            withAuthorization: true,
            params: nil,
            successBlock: { (responseObject: [String : Any]) in
                
                var productCallback: [Product] = []
                let productList = responseObject["data"] as? Array<Any> ?? []
                
                for product in productList {
                    let productObj = Product.init(data: product as! [String : Any])
                    productCallback.append(productObj)
                }
                
                callBack(productCallback)
                
        }) { (errorMessage: String) in
            message(errorMessage)
        }
        
    }
    
    func bannersAPI(callBack: @escaping ([Banner]) -> Void, message: @escaping (String) -> Void) {
        
        NetworkRequest.sharedInstance.callAPI(
            method: "GET",
            route: Constant.RouteBanners+DataManager.sharedInstance.getProvider(),
            withAuthorization: false,
            params: nil,
            successBlock: { (responseObject: [String : Any]) in
                
                var bannerCallback: [Banner] = []
                let bannerList = responseObject["data"] as? Array<Any> ?? []
                
                for banner in bannerList {
                    let bannerObj = Banner.init(data: banner as! [String : Any])
                    bannerCallback.append(bannerObj)
                }
                
                callBack(bannerCallback)
                
        }) { (errorMessage: String) in
            message(errorMessage)
        }
        
    }
    
}
