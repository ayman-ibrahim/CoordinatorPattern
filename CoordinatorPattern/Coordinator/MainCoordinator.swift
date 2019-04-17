//
//  MainCoordinator.swift
//  CoordinatorPattern
//
//  Created by Ayman Ibrahim on 4/17/19.
//  Copyright © 2019 Ayman Ibrahim. All rights reserved.
//

import UIKit


class MainCoordinator: Coordinator {
    
    var childCoordinators =  [Coordinator]()
    var navigationController: UINavigationController
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ViewController.inistaniate(storyboard: .Main)
        navigationController.setViewControllers([vc], animated: true)
    }
    
    
}
