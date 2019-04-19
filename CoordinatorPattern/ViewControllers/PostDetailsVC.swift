//
//  PostDetailsVC.swift
//  CoordinatorPattern
//
//  Created by Ayman Ibrahim on 4/18/19.
//  Copyright © 2019 Ayman Ibrahim. All rights reserved.
//

import UIKit

class PostDetailsVC: UIViewController, Storyboarded {
    
    weak var coordinator: PostDetailsCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.didFinishDisplayingDetails()//note this is indictor that the VC finsihed it's task, it could be called in any other action
    }
}
