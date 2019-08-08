//
//  APIManager.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 09/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import Foundation
import UIKit

class APIManager {
    
    private init() {}
    static let sharedInstance = APIManager()
    
    func loginAPI(param:[String:Any]!, callBack: @escaping (Login) -> Void, message: @escaping (String) -> Void) {
        
        NetworkRequest.sharedInstance.postAPI(
            route: Constant.RouteLogin,
            params: param,
            successBlock: { (responseObject: [String : Any]) in
                
                let login = Login.init(data: responseObject)
                callBack(login)
                
        }) { (errorMessage: String) in
            message(errorMessage)
        }
        
    }
    
    func sendOTPAPI(param:[String:Any]!, callBack: @escaping (Meta) -> Void, message: @escaping (String) -> Void) {
        
        NetworkRequest.sharedInstance.postAPI(
            route: Constant.RouteSendOTP,
            params: param,
            successBlock: { (responseObject: [String : Any]) in
                
                let meta = Meta.init(data: responseObject)
                callBack(meta)
                
        }) { (errorMessage: String) in
            message(errorMessage)
        }
        
    }
    
    func checkOTPAPI(param:[String:Any]!, callBack: @escaping (Meta) -> Void, message: @escaping (String) -> Void) {
        
        NetworkRequest.sharedInstance.postAPI(
            route: Constant.RouteCheckOTP,
            params: param,
            successBlock: { (responseObject: [String : Any]) in
                
                let meta = Meta.init(data: responseObject)
                callBack(meta)
                
        }) { (errorMessage: String) in
            message(errorMessage)
        }
        
    }
    
    func signUpAPI(param:[String:Any]!, callBack: @escaping (Meta) -> Void, message: @escaping (String) -> Void) {
        
        NetworkRequest.sharedInstance.postAPI(
            route: Constant.RouteSignUp,
            params: param,
            successBlock: { (responseObject: [String : Any]) in
                
                let meta = Meta.init(data: responseObject)
                callBack(meta)
                
        }) { (errorMessage: String) in
            message(errorMessage)
        }
        
    }
    
}
