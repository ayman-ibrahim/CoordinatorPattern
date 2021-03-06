//
//  PostDetailsCoordinator.swift
//  CoordinatorPattern
//
//  Created by Ayman Ibrahim on 4/19/19.
//  Copyright © 2019 Ayman Ibrahim. All rights reserved.
//

import UIKit

class PostDetailsCoordinator: Coordinator, PostHistory {
    
    weak var parentCoordinator: Coordinator?
    var childCoordinators =  [Coordinator]()
    var navigationController: UINavigationController
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = PostDetailsVC.inistaniate(storyboard: .Main)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func didFinishDisplayingDetails() {
        parentCoordinator?.childDidFinish(child: self)
    }
}

//MARK: - PostHistory -
extension PostDetailsCoordinator {
    func showPostHistory() {
        let postHistoyCoordinator = PostHistoryCoordinator(navigationController: self.navigationController)
        childCoordinators.append(postHistoyCoordinator)
        postHistoyCoordinator.parentCoordinator = self
        postHistoyCoordinator.start()
    }
}
