//
//  Storyboarded.swift
//  CoordinatorPattern
//
//  Created by Ayman Ibrahim on 4/17/19.
//  Copyright © 2019 Ayman Ibrahim. All rights reserved.
//

import UIKit

enum Storboard: String {
    case Main
}

protocol Storyboarded {
    static func inistaniate(storyboard: Storboard) -> Self
}

extension Storyboarded {
    static func inistaniate(storyboard: Storboard) -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self //forceCast: as storyboard class must always match it's storyboard id
    }
}
