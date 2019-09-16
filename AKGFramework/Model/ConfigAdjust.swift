//
//  ConfigAdjust.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 16/09/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import Foundation
import UIKit

class ConfigAdjust: NSObject, NSCoding {
    
    var app_token : String?
    var events : [ConfigEvent]? = []
    
    init(data: [String: Any]) {
        self.app_token = data["app_token"] as? String ?? ""
        
        let configList = data["events"] as? Array<Any> ?? []
        for configData in configList {
            let config = ConfigEvent.init(data: configData as? [String:Any] ?? [:])
            self.events?.append(config)
        }
    }
    
    required init(coder decoder: NSCoder) {
        self.app_token = decoder.decodeObject(forKey: "app_token") as? String ?? ""
        self.events = decoder.decodeObject(forKey: "events") as? [ConfigEvent] ?? nil
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(app_token, forKey: "app_token")
        coder.encode(events, forKey: "events")
    }
}
