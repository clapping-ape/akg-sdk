//
//  BindAccountPresenter.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 06/09/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import Foundation

protocol BindAccountView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func sendOTPSuccess()
    func checkOTPSuccess()
    func bindAccountSuccess()
    func setErrorMessageFromAPI(errorMessage: String)
}

internal class BindAccountPresenter {
    
    weak fileprivate var bindAccountView : BindAccountView?
    
    private init() {}
    static let sharedInstance = BindAccountPresenter()
    
    func attachView(view: BindAccountView) {
        
        self.bindAccountView = view
    }
    
    func detachView() {
        self.bindAccountView = nil
    }
    
    func postSendOTPAPI(param: [String:Any]!) {
        self.bindAccountView?.startLoading()
        
        APIManager.sharedInstance.sendOTPAPI(param: param!, callBack: { [weak self](meta) in
            
            self?.bindAccountView?.finishLoading()
            self?.bindAccountView?.sendOTPSuccess()
            
            
        }) { (message) in
            
            self.bindAccountView?.finishLoading()
            self.bindAccountView?.setErrorMessageFromAPI(errorMessage: message)
        }
        
    }
    
    func postCheckOTPAPI(param: [String:Any]!) {
        self.bindAccountView?.startLoading()
        
        APIManager.sharedInstance.checkOTPAPI(param: param!, callBack: { [weak self](meta) in
            
            self?.bindAccountView?.finishLoading()
            self?.bindAccountView?.checkOTPSuccess()
            
            
        }) { (message) in
            
            self.bindAccountView?.finishLoading()
            self.bindAccountView?.setErrorMessageFromAPI(errorMessage: message)
        }
        
    }
    
    
    func postBindAccountAPI(param: [String:Any]!) {
        self.bindAccountView?.startLoading()
        
        APIManager.sharedInstance.phoneBindingAPI(param: param!, callBack: { [weak self](meta) in
            
            self?.bindAccountView?.finishLoading()
            self?.bindAccountView?.bindAccountSuccess()
            
            
        }) { (message) in
            
            self.bindAccountView?.finishLoading()
            self.bindAccountView?.setErrorMessageFromAPI(errorMessage: message)
        }
        
    }
    
}
