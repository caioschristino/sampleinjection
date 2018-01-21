//
//  RequestInfo.swift
//
//  Created by Caio Sanchez Christino on 30/11/17.
//  Copyright © 2017 Caio Sanchez Christino. All rights reserved.
//
import Foundation

struct RequestInfo {
    let status: String
    let message: String
    let generatedDate: AnyObject
}

extension RequestInfo: JSONDecodable {
    init?(dictionary: JSONDictionary) {
        guard let status = dictionary["status"] as? String,
            let message = dictionary["message"] as? String else {
                return nil
        }
        
        self.status = status
        self.message = message
        self.generatedDate = (dictionary["generatedDate"] as? AnyObject)!
    }
}
