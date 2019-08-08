//
//  Meta.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 08/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import Foundation

class Meta: NSObject {
    
    var status : Bool?
    var code : Int?
    
    init(data: [String: Any]) {
        self.status = data["status"] as? Bool ?? false
        self.code = data["code"] as? Int ?? 0
    }
    
}
