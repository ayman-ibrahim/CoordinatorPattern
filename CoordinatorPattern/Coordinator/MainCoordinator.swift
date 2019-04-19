//
//  MainCoordinator.swift
//  CoordinatorPattern
//
//  Created by Ayman Ibrahim on 4/17/19.
//  Copyright © 2019 Ayman Ibrahim. All rights reserved.
//

import UIKit


class MainCoordinator: NSObject, Coordinator, PostDetails {
    
    var childCoordinators =  [Coordinator]()
    var navigationController: UINavigationController
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        let vc = PostsVC.inistaniate(storyboard: .Main)
        vc.coordinator = self
        navigationController.setViewControllers([vc], animated: true)
    }
    
    //MARK: - Navigation -
    func showPostDetails(id: Int) {
        let child = PostDetailsCoordinator(navigationController: self.navigationController)
        print(id)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
}


extension MainCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromVC = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        if navigationController.viewControllers.contains(fromVC) {
            return
        }
        
        if let vc = fromVC as? PostDetailsVC {
            vc.coordinator?.didFinishDisplayingDetails()
        } else if let vc = fromVC as? PostHistoryVC {
            vc.coordinator?.didFinishDisplayingHistory()
        }
    }
}
