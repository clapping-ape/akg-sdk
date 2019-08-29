//
//  UserAttributes.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 29/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import Foundation

class UserAttributes: NSObject {
    
    var uid : String?
    var email : String?
    var phone_number : String?
    var auth_provider : String?
    var game_provider : String?
    var created_at : String?
    
    init(data: [String: Any]) {
        self.uid = data["uid"] as? String ?? ""
        self.email = data["email"] as? String ?? ""
        self.phone_number = data["phone_number"] as? String ?? ""
        self.auth_provider = data["auth_provider"] as? String ?? ""
        self.game_provider = data["game_provider"] as? String ?? ""
        self.created_at = data["created_at"] as? String ?? ""
    }
    
}
