//
//  LoginPresenter.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 08/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import Foundation

protocol LoginView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func sendOTPSuccess()
    func setErrorMessageFromAPI(errorMessage: String)
}

internal class LoginPresenter {
    
    weak fileprivate var loginView : LoginView?
    
    private init() {}
    static let sharedInstance = LoginPresenter()
    
    func attachView(view: LoginView) {
        
        self.loginView = view
    }
    
    func detachView() {
        self.loginView = nil
    }
    
    func postSendOTPAPI(param: [String:Any]!) {
        self.loginView?.startLoading()
        
        APIManager.sharedInstance.sendOTPAPI(param: param!, callBack: { [weak self](meta) in

            self?.loginView?.finishLoading()
            self?.loginView?.sendOTPSuccess()


        }) { (message) in

            self.loginView?.finishLoading()
            self.loginView?.setErrorMessageFromAPI(errorMessage: message)
        }

    }
    
}
