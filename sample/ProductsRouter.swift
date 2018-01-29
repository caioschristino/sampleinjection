//
//  ProductsRouter.swift
//  sample
//
//  Created by Kio Coan on 29/01/18.
//  Copyright © 2018 Caio Sanchez Christino. All rights reserved.
//

import UIKit

class ProfileRouter: BaseRouter {
    
    func show() {
        let viewController = ProductsViewController(nibName: "ProductsView", bundle: nil)
        let navigation = UINavigationController.init(rootViewController: viewController)
        navigation.isNavigationBarHidden = true
        self.presentViewController(controller: navigation, animated: true, transition: .coverVertical)
    }
}
