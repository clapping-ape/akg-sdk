//
//  RegisterPresenter.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 09/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import Foundation

protocol RegisterView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func sendOTPSuccess()
    func checkOTPSuccess()
    func signUpSuccess()
    func setErrorMessageFromAPI(errorMessage: String)
}

internal class RegisterPresenter {
    
    weak fileprivate var registerView : RegisterView?
    
    private init() {}
    static let sharedInstance = RegisterPresenter()
    
    func attachView(view: RegisterView) {
        
        self.registerView = view
    }
    
    func detachView() {
        self.registerView = nil
    }
    
    func postSendOTPAPI(param: [String:Any]!) {
        self.registerView?.startLoading()
        
        APIManager.sharedInstance.sendOTPAPI(param: param!, callBack: { [weak self](meta) in
        
            self?.registerView?.finishLoading()
            self?.registerView?.sendOTPSuccess()
            
            
        }) { (message) in
    
            self.registerView?.finishLoading()
            self.registerView?.setErrorMessageFromAPI(errorMessage: message)
        }
    
    }
    
    func postCheckOTPAPI(param: [String:Any]!) {
        self.registerView?.startLoading()
        
        APIManager.sharedInstance.checkOTPAPI(param: param!, callBack: { [weak self](meta) in
        
            self?.registerView?.finishLoading()
            self?.registerView?.checkOTPSuccess()
            
            
        }) { (message) in

            self.registerView?.finishLoading()
            self.registerView?.setErrorMessageFromAPI(errorMessage: message)
        }
    
    }
    
    
    func postSignUpAPI(param: [String:Any]!) {
        self.registerView?.startLoading()
        
        APIManager.sharedInstance.sendOTPAPI(param: param!, callBack: { [weak self](meta) in
            
            self?.registerView?.finishLoading()
            self?.registerView?.signUpSuccess()
            
            
        }) { (message) in
            
            self.registerView?.finishLoading()
            self.registerView?.setErrorMessageFromAPI(errorMessage: message)
        }
        
    }
    
}
