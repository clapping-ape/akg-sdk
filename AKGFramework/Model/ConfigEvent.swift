//
//  ConfigEvent.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 16/09/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import Foundation

class ConfigEvent: NSObject, NSCoding {
    
    var name : String?
    var token : String?
    
    init(data: [String: Any]) {
        self.name = data["name"] as? String ?? ""
        self.token = data["token"] as? String ?? ""
    }
    
    required init(coder decoder: NSCoder) {
        self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
        self.token = decoder.decodeObject(forKey: "token") as? String ?? ""
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(token, forKey: "token")
    }
    
}
