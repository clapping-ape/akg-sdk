//
//  DataManager.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 09/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import Foundation
import UIKit

class DataManager {
    
    private init() {}
    static let sharedInstance = DataManager()
    
    func isLogin() -> Bool {
        return UserDefaults.standard.object(forKey: "AUTH_TOKEN_USERDEFAULTS") != nil
    }
    
    func clearAllSession() {
        UserDefaults.standard.removeObject(forKey: "AUTH_TOKEN_USERDEFAULTS")
    }
    
    func setAuthToken(token: String) {
        UserDefaults.standard.set(token, forKey: "AUTH_TOKEN_USERDEFAULTS")
    }
    
    func getAuthToken() -> String {
        return UserDefaults.standard.value(forKey: "AUTH_TOKEN_USERDEFAULTS") as! String
    }
    
}
