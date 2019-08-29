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
    
    typealias SuccessHandlerObject = (_ responseObject: [String: Any]) -> Void
    typealias SuccessHandlerArray = (_ responseObject: Array<Any>) -> Void
    typealias FailHandler = (_ errorMessage: String) -> Void
    
}

extension NetworkRequest {
    
    func getAPI(route: String, successBlock: @escaping SuccessHandlerObject, failureBlock:@escaping FailHandler) {
        
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        
        var request = URLRequest(url: URL(string: Constant.BaseURL+route)!)
        request.httpMethod = "GET"
        request.addValue(DataManager.sharedInstance.getAuthToken(), forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        print("URL: ", Constant.BaseURL+route)
        
        let task = session.dataTask(with: request, completionHandler: { [weak self] (data: Data?, response: URLResponse?, error: Error?) -> Void in
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
                        if let data = json["data"] as? [String:Any]? {
                            successBlock(data ?? [:])
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
    
    func postAPI(route: String, withAuthorization: Bool, params: [String:Any], successBlock: @escaping SuccessHandlerObject, failureBlock:@escaping FailHandler) {
        
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        
        var request = URLRequest(url: URL(string: Constant.BaseURL+route)!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        if withAuthorization {
            request.addValue(DataManager.sharedInstance.getAuthToken(), forHTTPHeaderField: "Authorization")
        }
        
        print("URL: ", Constant.BaseURL+route)
        print("Body: ", params)
        
        let task = session.dataTask(with: request, completionHandler: { [weak self] (data: Data?, response: URLResponse?, error: Error?) -> Void in
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
                        if let data = json["data"] as? [String:Any]? {
                            successBlock(data ?? [:])
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
}
