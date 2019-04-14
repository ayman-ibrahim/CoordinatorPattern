//
//  RemoteContext.swift
//  CoordinatorPattern
//
//  Created by Ayman Ibrahim on 4/14/19.
//  Copyright © 2019 Ayman Ibrahim. All rights reserved.
//

import UIKit

enum HTTPMethod: String {
    case get, post
}

struct Resource<T> {
    let endPoint: Endpoint
    let method:HTTPMethod
    let parse: (Data)->(T?)
}

class RemoteContext {
    
    func getRequest<T>(resource: Resource<T>, completion: @escaping (Error?, T?)->()) {
        guard let url = resource.endPoint.url else {
            preconditionFailure("invalidURL")
        }
        URLSession.shared.dataTask(with: url) { (dataResponse, response, error) in
            print("response")
            if let data = dataResponse {
                print(data)
                completion(nil, resource.parse(data))
            } else {
                completion(error, nil)
            }
        }.resume()
    }
}
