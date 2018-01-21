//
//  UserRating.swift
//
//  Created by Caio Sanchez Christino on 30/11/17.
//  Copyright © 2017 Caio Sanchez Christino. All rights reserved.
//

import Foundation

struct UserRating {
    let comments: Int
    let rating: Int
}

extension UserRating: JSONDecodable {
    init?(dictionary: JSONDictionary) {
        guard let comments = dictionary["comments"] as? Int,
            let rating = dictionary["rating"] as? Int else {
                return nil
        }
        
        self.rating = rating
        self.comments = comments
    }
}
