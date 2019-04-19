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
        let vc = PostsVC.inistaniate(storyboard: .Main)
        vc.coordinator = self
        navigationController.setViewControllers([vc], animated: true)
    }
    
    func showPostDetails() {
        let child = PostDetailsCoordinator(navigationController: self.navigationController)
        childCoordinators.append(child)
        child.start()
    }
    
    func childDidFinish(child: Coordinator) {
        for (inedx, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: inedx)
                break
            }
        }
    }
}
