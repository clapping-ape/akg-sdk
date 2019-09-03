//
//  AccountPresenter.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 29/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import Foundation

protocol AccountView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func bindAccountSuccess()
    func changePasswordSuccess()
    func setErrorMessageFromAPI(errorMessage: String)
}

internal class AccountPresenter {
    
    weak fileprivate var accountView : AccountView?
    
    private init() {}
    static let sharedInstance = AccountPresenter()
    
    func attachView(view: AccountView) {
        
        self.accountView = view
    }
    
    func detachView() {
        self.accountView = nil
    }
    
    func postBindAccountAPI(param: [String:Any]!) {
        self.accountView?.startLoading()
        
        APIManager.sharedInstance.bindAccountAPI(param: param!, callBack: { [weak self](login) in
            
            DataManager.sharedInstance.setAuthToken(token: login.token!)
            
            self?.accountView?.finishLoading()
            self?.accountView?.bindAccountSuccess()
            
            
        }) { (message) in
            
            self.accountView?.finishLoading()
            self.accountView?.setErrorMessageFromAPI(errorMessage: message)
        }
        
    }
    
    func postResetPasswordAPI(param: [String:Any]!) {
        self.accountView?.startLoading()
        
        APIManager.sharedInstance.changePasswordAPI(param: param!, callBack: { [weak self](meta) in
            
            self?.accountView?.finishLoading()
            self?.accountView?.changePasswordSuccess()
            
            
        }) { (message) in
            
            self.accountView?.finishLoading()
            self.accountView?.setErrorMessageFromAPI(errorMessage: message)
        }
        
    }
}
