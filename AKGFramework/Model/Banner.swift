//
//  Banner.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 23/09/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import Foundation

class Banner: NSObject {
    
    var id : String?
    var type : String?
    var title : String?
    var image_link_url : String?
    var cover_image_url : String?
    var thumb_url : String?
    
    init(data: [String: Any]) {
        self.id = data["id"] as? String ?? ""
        self.type = data["type"] as? String ?? ""
        
        if let attr = data["attributes"] as? [String:Any] {
            self.title = attr["title"] as? String ?? ""
            self.image_link_url = attr["image_link_url"] as? String ?? ""
            
            if let cover_image = attr["cover_image"] as? [String:Any] {
                self.cover_image_url = cover_image["url"] as? String ?? ""
                
                if let thumb = cover_image["thumb"] as? [String:Any] {
                    self.thumb_url = thumb["url"] as? String ?? ""
                }
                
            }
            
        }
    }
    
}
