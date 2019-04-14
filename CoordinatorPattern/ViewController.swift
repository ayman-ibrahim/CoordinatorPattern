//
//  ViewController.swift
//  CoordinatorPattern
//
//  Created by Ayman Ibrahim on 4/14/19.
//  Copyright © 2019 Ayman Ibrahim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let remoteContext = RemoteContext()
    let resource = Resource<[Article]>(endPoint: Endpoint(path: "/posts", queryItems: []), method: HTTPMethod.get) { data in
        let decoder = JSONDecoder()
        
        let model = try? decoder.decode([Article].self, from: data)
        return model
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        remoteContext.getRequest(resource: resource) { (error, model)  -> () in
            print("data")
            print()
        }
    }


}

