//
//  Login.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 09/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import Foundation

class Login: NSObject {
    
    var token : String?
    
    init(data: [String: Any]) {
        self.token = data["token"] as? String ?? ""
    }
    
}
