//
//  Ebit.swift
//  wish-list
//
//  Created by Caio Sanchez Christino on 01/12/17.
//  Copyright © 2017 Caio Sanchez Christino. All rights reserved.
//

import Foundation

struct Ebit {
    let id: Int!
    let name: String!
    let rating: Int!
}

extension Ebit: JSONDecodable {
    init?(dictionary: JSONDictionary) {
        guard let id = dictionary["id"] as? Int!,
            let name = dictionary["name"] as? String!,
            let rating = dictionary["rating"] as? Int! else {
                return nil
        }
        
        self.id = id
        self.name = name
        self.rating = rating
    }
}
