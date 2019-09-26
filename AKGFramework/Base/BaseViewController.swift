//
//  BaseViewController.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 08/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import UIKit

public class BaseViewController: UIViewController {
    
    var loadingViewController = LoadingViewController()

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.frame = CGRect.init(x: 0, y: 0, width: (self.getTopMostViewController()?.view.bounds.size.width)!, height: (self.getTopMostViewController()?.view.bounds.size.height)!)
        
    }
    
    public func getTopMostViewController() -> UIViewController? {
        var topMostViewController = UIApplication.shared.keyWindow?.rootViewController
        
        while let navigationController = topMostViewController as? UINavigationController {
            topMostViewController = navigationController.viewControllers.first
        }
        
        while let presentedViewController = topMostViewController?.presentedViewController {
            topMostViewController = presentedViewController
        }
        
        return topMostViewController
    }
    
    public func basicAlertView(title: String, message: String, successBlock: (() -> Swift.Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {
            (alert: UIAlertAction!) in
            successBlock!()
        }
        ))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    public func hideNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    public func showNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    public func showLoadingIndicator() {
        add(loadingViewController)
    }
    
    public func hideLoadingIndicator() {
        loadingViewController.remove()
    }

}

extension UIViewController {
    
    public func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    public func remove() {
        guard parent != nil else {
            return
        }
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
}
