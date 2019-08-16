//
//  ForgotPasswordPresenter.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 15/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import Foundation

protocol ForgotPasswordView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func sendOTPSuccess()
    func checkOTPSuccess()
    func updatePasswordSuccess()
    func setErrorMessageFromAPI(errorMessage: String)
}

internal class ForgotPasswordPresenter {
    
    weak fileprivate var forgotPasswordView : ForgotPasswordView?
    
    private init() {}
    static let sharedInstance = ForgotPasswordPresenter()
    
    func attachView(view: ForgotPasswordView) {
        
        self.forgotPasswordView = view
    }
    
    func detachView() {
        self.forgotPasswordView = nil
    }
    
    func postSendOTPAPI(param: [String:Any]!) {
//        self.forgotPasswordView?.startLoading()
//
//        APIManager.sharedInstance.sendOTPAPI(param: param!, callBack: { [weak self](meta) in
//
//            self?.forgotPasswordView?.finishLoading()
            self.forgotPasswordView?.sendOTPSuccess()
//
//
//        }) { (message) in
//
//            self.forgotPasswordView?.finishLoading()
//            self.forgotPasswordView?.setErrorMessageFromAPI(errorMessage: message)
//        }
        
    }
    
    func postCheckOTPAPI(param: [String:Any]!) {
//        self.forgotPasswordView?.startLoading()
//
//        APIManager.sharedInstance.checkOTPAPI(param: param!, callBack: { [weak self](meta) in
//
//            self?.forgotPasswordView?.finishLoading()
            self.forgotPasswordView?.checkOTPSuccess()
//
//
//        }) { (message) in
//
//            self.forgotPasswordView?.finishLoading()
//            self.forgotPasswordView?.setErrorMessageFromAPI(errorMessage: message)
//        }
    
    }
    
    
    func postResetPasswordAPI(param: [String:Any]!) {
//        self.forgotPasswordView?.startLoading()
//
//        APIManager.sharedInstance.updatePasswordAPI(param: param!, callBack: { [weak self](meta) in
//
//            self?.forgotPasswordView?.finishLoading()
            self.forgotPasswordView?.updatePasswordSuccess()
//
//
//        }) { (message) in
//
//            self.forgotPasswordView?.finishLoading()
//            self.forgotPasswordView?.setErrorMessageFromAPI(errorMessage: message)
//        }
    
    }
    
}
