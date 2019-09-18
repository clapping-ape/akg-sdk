//
//  AKGFrameworkManager.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 16/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import Foundation
import UIKit
import PassKit

@objc public protocol AKGDelegate:class {
    @objc optional func akgUserDidAllowed()
    @objc optional func akgForgotPasswordSuccess()
    @objc optional func akgUserDidLoggedOut()
}

public class AKGFrameworkManager {
    
    public static let sharedInstance = AKGFrameworkManager()
    public var akgDelegate: AKGDelegate?
    public var isTokenActive: Bool
    
    var paymentController: UIViewController?
    
    public init() {
        AKGFontManager.init()
        self.isTokenActive = DataManager.sharedInstance.isLogin()
    }
    
    public func showLoginView(viewController: UIViewController!) {
        viewController.add(LoginViewController())
    }
    
    public func showFloatingAKGButton(viewController: UIViewController!) {
        viewController.add(FloatingButtonViewController())
    }
    
    public func getProductList(products: @escaping ([Product]) -> Void, error: @escaping (String) -> Void) {
        
        APIManager.sharedInstance.productListAPI(callBack: { (product) in
            products(product)
            
        }) { (message) in
            error(message)
        }
        
    }
    
    public func payWithInAppPurchase(product: Product!) {
        
        InAppPurchaseHandler.sharedInstance.setProductIds(ids: [product.sku!])
        
        InAppPurchaseHandler.sharedInstance.fetchAvailableProducts { (products) in
            
            InAppPurchaseHandler.sharedInstance.purchase(product: products.first!, completion: { (alertType, skProduct, transaction) in
                print("PRODUCTS: ", skProduct)
                print("TRANSACTION: ", transaction)
            })
        }
    }
    
    public func payWithApplePay(viewController: UIViewController!, label: String, amount: Double) {
        self.paymentController = viewController
        
        let paymentNetworks = [PKPaymentNetwork.amex, .discover, .masterCard, .visa]
        
        if PKPaymentAuthorizationViewController.canMakePayments(usingNetworks: paymentNetworks) {
            let request = PKPaymentRequest()
            request.currencyCode = "IDR"
            request.countryCode = "ID"
            request.merchantIdentifier = "merchant.com.akggames.iosframework"
            request.merchantCapabilities = PKMerchantCapability.capability3DS
            request.supportedNetworks = paymentNetworks
            
            let paymentItem = PKPaymentSummaryItem.init(label: label, amount: NSDecimalNumber(value: amount))
            request.paymentSummaryItems = [paymentItem]
            
            
            guard let paymentVC = PKPaymentAuthorizationViewController(paymentRequest: request) else {
                
                return
            }
//            paymentVC.delegate = self
            viewController.present(paymentVC, animated: true, completion: nil)
            
        }else {
            let alert = UIAlertController(title: "Sorry", message: "Apple Pay currently not available.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {
                (alert: UIAlertAction!) in

            }
            ))

            viewController.present(alert, animated: true, completion: nil)
        }
    }
    
//    public func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {
//        self.paymentController?.dismiss(animated: true, completion: nil)
//    }
//    
//    @available(iOS 11.0, *)
//    public func paymentAuthorizationViewController(_ controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {
//    }

}
