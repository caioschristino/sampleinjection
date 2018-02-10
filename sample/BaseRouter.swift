//
//  BaseRouter.swift
//  sample
//
//  Created by Kio Coan on 29/01/18.
//  Copyright © 2018 Caio Sanchez Christino. All rights reserved.
//

import Foundation

import UIKit

public enum PresentationStyle {
    case modal
    case push
}

class BaseRouter {
    
    //-----------------------------------------------------------------------
    // MARK: Init
    //-----------------------------------------------------------------------
    
    public static var lastPresentationStyle: PresentationStyle!
    public static var currentPresentationStyle: PresentationStyle!
    public static var sourceViewController: UIViewController?
    
    func setRouterSourceViewController(controller: UIViewController?) {
        BaseRouter.sourceViewController = controller
    }
    
    func getRootView() -> UIViewController {
        var viewController: UIViewController?
        viewController = ViewController(nibName: "HomeView", bundle: nil)
        let navigationVC = UINavigationController(rootViewController: viewController!)
        navigationVC.navigationBar.isHidden = true
        BaseRouter.sourceViewController = viewController
        return navigationVC
    }
    
    func pushViewController(controller: UIViewController?){
        BaseRouter.lastPresentationStyle = BaseRouter.currentPresentationStyle
        BaseRouter.currentPresentationStyle = .push
        BaseRouter.sourceViewController?.navigationController?.pushViewController((controller)!, animated: true)
        BaseRouter.sourceViewController = controller
    }
    
    func presentViewController(controller: UIViewController?, animated: Bool, transition: UIModalTransitionStyle?){
        BaseRouter.lastPresentationStyle = BaseRouter.currentPresentationStyle
        BaseRouter.currentPresentationStyle = .modal
        if transition != nil {
            controller?.modalTransitionStyle = transition!
        }
        BaseRouter.sourceViewController?.present(controller!, animated: animated, completion: nil)
        if controller is UINavigationController {
            
            let navigationVC = controller as! UINavigationController
            BaseRouter.sourceViewController = navigationVC.viewControllers.first
        }else{
            BaseRouter.sourceViewController = controller
        }
    }
    
    func dismissViewController() {
        switch BaseRouter.currentPresentationStyle! {
        case .modal:
            BaseRouter.sourceViewController?.dismiss(animated: true, completion: nil)
            break
            
        case .push:
            BaseRouter.sourceViewController?.navigationController?.popViewController(animated: true)
            break
        }
        BaseRouter.currentPresentationStyle = BaseRouter.lastPresentationStyle
    }
}

