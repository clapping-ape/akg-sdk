//
//  NetworkRequest.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 08/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import Foundation
import UIKit

class NetworkRequest {
    
    private init() {}
    static let sharedInstance = NetworkRequest()
    let imageCache = NSCache<NSString, UIImage>()
    
    typealias SuccessHandlerObject = (_ responseObject: [String: Any]) -> Void
    typealias SuccessHandlerArray = (_ responseObject: Array<Any>) -> Void
    typealias FailHandler = (_ errorMessage: String) -> Void
    
}

extension NetworkRequest {
    
    
    func callAPI(method: String, route: String, withAuthorization: Bool, params: [String:Any]?, successBlock: @escaping SuccessHandlerObject, failureBlock:@escaping FailHandler) {
        
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        
        var request = URLRequest(url: URL(string: Constant.BaseURL+route)!)
        request.httpMethod = method
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        if (params != nil) {
            request.httpBody = try? JSONSerialization.data(withJSONObject: params!, options: [])
        }
        if withAuthorization {
            request.addValue(DataManager.sharedInstance.getAuthToken(), forHTTPHeaderField: "Authorization")
        }
        
        print("URL: ", Constant.BaseURL+route)
        print("Auth Token: ", DataManager.sharedInstance.getAuthToken())
        print("Body: ", params ?? "")
        
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            
            guard let data = data else {
                successBlock([:])
                failureBlock(error?.localizedDescription ?? "Error: No response data from server.")
                return
            }
            
            guard let json = try? (JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String:Any]) else {
                successBlock([:])
                failureBlock(error?.localizedDescription ?? "Error: Response object is not json format.")
                return
            }
            
            
            print("Response: ", json)
            
            if let meta = json["meta"] as? [String:Any]? ?? [:] {
                if let status = meta["status"] as? Bool? ?? false {
                    if status {
                        let data = json["data"]
                        if ((data as? [String:Any]?) != nil) {
                            successBlock(data as! [String : Any])
                        }else if ((data as? Array<Any>?) != nil) {
                            successBlock(json)
                        }else{
                            successBlock([:])
                        }
                    }else{
                        if let data = json["data"] as? [String:Any]? {
                            failureBlock(data!["message"] as? String ?? "Unknown Error")
                        }else{
                            failureBlock("Unknown Error")
                        }
                    }
                }else{
                    failureBlock("Error: Meta status is not defined.")
                }
            }else{
                failureBlock("Error: Meta data is not defined.")
            }
            
        })
        task.resume()
    }
    
    func getImageURL(StringURL: String, successBlock: @escaping (_ responseObject: UIImage) -> Void, failureBlock:@escaping FailHandler) {
        
        let imageURL = URL(string: StringURL)
        
        if let cachedImage = self.imageCache.object(forKey: imageURL!.absoluteString as NSString) {
            successBlock(cachedImage)
            
        }else {
            
            let task = URLSession.shared.dataTask(with: imageURL!) { (data: Data?, response: URLResponse?, error: Error?) -> Void in
                
                guard let data = data else {
                    failureBlock(error?.localizedDescription ?? "Error: No response data from server.")
                    return
                }
                
                if error == nil {
                    let loadedImage = UIImage(data: data)
                    self.imageCache.setObject(loadedImage!, forKey: imageURL!.absoluteString as NSString)
                    successBlock(loadedImage!)
                }else{
                    failureBlock(error!.localizedDescription)
                }
                
            }
            task.resume()
            
        }
        
    }
    
}
