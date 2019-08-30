//
//  User.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 29/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import Foundation

class User: NSObject {
    
    var id : String?
    var type : String?
    var attributes : UserAttributes?
    
    init(data: [String: Any]) {
        self.id = data["id"] as? String ?? ""
        self.type = data["type"] as? String ?? ""
        
        let attr = UserAttributes.init(data: data["attributes"] as? [String:Any] ?? [:])
        self.attributes = attr
    }
    
}
