//
//  WishCategory.swift
//
//  Created by Caio Sanchez Christino on 01/12/17.
//  Copyright © 2017 Caio Sanchez Christino. All rights reserved.
//

import Foundation

struct WishCategory {
    let id: Int
    let name: String
    let thumbnail: Thumbnail
    let hasProduct: Int
    let hasOffer: Int
}

extension WishCategory: JSONDecodable {
    init?(dictionary: JSONDictionary) {
        guard let id = dictionary["id"] as? Int,
            let name = dictionary["name"] as? String,
            let thumbnail = dictionary["thumbnail"] as? JSONDictionary,
            let hasProduct = dictionary["hasProduct"] as? Int,
            let hasOffer = dictionary["hasOffer"] as? Int else {
                return nil
        }
        
        self.id = id
        self.name = name
        self.thumbnail = Thumbnail(dictionary: thumbnail)!
        self.hasProduct = hasProduct
        self.hasOffer = hasOffer
    }
}
