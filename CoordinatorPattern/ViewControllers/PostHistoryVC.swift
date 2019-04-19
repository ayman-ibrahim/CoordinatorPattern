//
//  PostHistoryVC.swift
//  CoordinatorPattern
//
//  Created by Ayman Ibrahim on 4/19/19.
//  Copyright © 2019 Ayman Ibrahim. All rights reserved.
//

import UIKit

class PostHistoryVC: UIViewController, Storyboarded {
    
    weak var coordinator: PostHistoryCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        print("deinit PostHistoryVC")
    }
}
