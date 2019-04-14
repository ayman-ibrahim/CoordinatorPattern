//
//  EndPoint.swift
//  CoordinatorPattern
//
//  Created by Ayman Ibrahim on 4/14/19.
//  Copyright © 2019 Ayman Ibrahim. All rights reserved.
//

import Foundation

fileprivate let host = "jsonplaceholder.typicode.com"

//EndPoints ******* ----------------
struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]
}

//example
extension Endpoint {
    static func search(matching query: String) -> Endpoint {
        return Endpoint(
            path: "/search/repositories",
            queryItems: [
                URLQueryItem(name: "q", value: query),
                URLQueryItem(name: "sort", value: "sorting.rawValue")
            ]
        )
    }
}
//
/*
 //https://www.swiftbysundell.com/posts/constructing-urls-in-swift
 As the number of parameters might grow, we'll quickly end up with quite messy code that is hard to read, since all that we're doing is adding up strings using concatenation and interpolation.
 Since query is a normal string, it can contain any kind of special characters and emoji that could result in an invalid URL. We could of course encode the query using the addingPercentEncoding API, but it'd be much nicer to have the system take care of that for us.
 */

extension Endpoint {
    // We still have to keep 'url' as an optional, since we're
    // dealing with dynamic components that could be invalid.
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path
        if queryItems.count > 0 {
            components.queryItems = queryItems
        }
        return components.url
    }
}

//StaticString can't be the result of any dynamic expression - such as string interpolation or concatenatio
//let str: StaticString = "\(Hello)"
extension URL {
    init(staticString string: StaticString) {
        guard let url = URL(string: "\(string)") else {
            preconditionFailure("Invalid static URL string: \(string)")
        }
        self = url
    }
}
//let url = URL(staticString: "str")
