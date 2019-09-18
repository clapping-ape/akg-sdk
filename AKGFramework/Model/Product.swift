//
//  Product.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 17/09/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import Foundation

open class Product: NSObject {
    
    open var id : String?
    open var name : String?
    open var desc : String?
    open var platform : String?
    open var price : String?
    open var status : String?
    open var image : String?
    open var thumb_image : String?
    open var qty : Int?
    open var unit : String?
    var sku : String?
    
    public init(data: [String: Any]) {
        
        let attributes = data["attributes"] as? [String:Any] ?? [:]
        
        self.id = data["id"] as? String ?? ""
        self.name = attributes["name"] as? String ?? ""
        self.desc = attributes["description"] as? String ?? ""
        self.platform = attributes["platform"] as? String ?? ""
        self.price = attributes["price"] as? String ?? ""
        self.status = attributes["status"] as? String ?? ""
        
        let imageObj = attributes["image"] as? [String:Any] ?? [:]
        self.image = imageObj["url"] as? String ?? ""
        
        let thumbObj = imageObj["thumb"] as? [String:Any] ?? [:]
        self.thumb_image = thumbObj["url"] as? String ?? ""
        
        
        self.qty = attributes["qty"] as? Int ?? nil
        self.unit = attributes["unit"] as? String ?? ""
        self.sku = attributes["product_code"] as? String ?? ""
    }
    
}
