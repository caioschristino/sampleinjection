//
//  Resource.swift
//
//  Created by Caio Sanchez Christino on 30/11/17.
//  Copyright © 2017 Caio Sanchez Christino. All rights reserved.
//

import Foundation

enum Method: String {
    case GET = "GET"
}

protocol Resource {
    var method: Method { get }
    var path: String { get }
    var parameters: [String: String] { get }
}

extension Resource {
    var method: Method {
        return .GET
    }
    
    func requestWithBaseURL(baseURL: NSURL) -> NSURLRequest {
        let URL = baseURL
        
        if(!path .isEmpty){
            URL.appendingPathComponent(path)
        }
        
        // NSURLComponents can fail due to programming errors, so
        // prefer crashing than returning an optional
        guard var components = URLComponents(url: URL as URL, resolvingAgainstBaseURL: false) else {
            fatalError("Unable to create URL components from \(String(describing: URL))")
        }
        
        if(parameters.count > 1){
            components.queryItems = parameters.map {
                URLQueryItem(name: String($0), value: String($1))
            }
        }
        
        guard let finalURL = components.url else {
            fatalError("Unable to retrieve final URL")
        }
        
        let request = NSMutableURLRequest(url: finalURL)
        request.httpMethod = method.rawValue
        
        return request
    }
}
