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
    
}
