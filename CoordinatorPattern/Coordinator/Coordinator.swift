//
//  Coordinator.swift
//  CoordinatorPattern
//
//  Created by Ayman Ibrahim on 4/17/19.
//  Copyright © 2019 Ayman Ibrahim. All rights reserved.
//

import UIKit

protocol PostDetails: AnyObject {
    func showPostDetails(id: Int)
}

protocol PostHistory {
    func showPostHistory()
}

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func childDidFinish(child: Coordinator)
    
    func start()
}

extension Coordinator {
    func childDidFinish(child: Coordinator) {
        for (inedx, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: inedx)
                break
            }
        }
    }
}

