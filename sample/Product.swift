//
//  Product.swift
//
//  Created by Caio Sanchez Christino on 30/11/17.
//  Copyright © 2017 Caio Sanchez Christino. All rights reserved.
//

import Foundation

struct Product {
    let id: Int
    let name: String
    let shortName: String
    let priceMin: Double
    let priceMax: Double
    let discount: Int
    let thumbnail: Thumbnail
    let userRating: UserRating
    let category: WishCategory
    let hasOffer: Int
    let link: String
    
}

extension Product: JSONDecodable {
    init?(dictionary: JSONDictionary) {
        guard let id = dictionary["id"] as? Int,
            let name = dictionary["name"] as? String,
            let thumbnail = dictionary["thumbnail"] as? JSONDictionary,
            let shortName = dictionary["shortName"] as? String,
            let hasOffer = dictionary["hasOffer"] as? Int,
            let priceMin = dictionary["priceMin"] as? Double,
            let priceMax = dictionary["priceMax"] as? Double,
            let discount = dictionary["discount"] as? Int,
            let userRating = dictionary["userRating"] as? JSONDictionary,
            let category = dictionary["category"] as? JSONDictionary,
            let link = dictionary["link"] as? String else {
                return nil
        }
        
        self.id = id
        self.name = name
        self.thumbnail = Thumbnail(dictionary: thumbnail)!
        self.hasOffer = hasOffer
        self.shortName = shortName
        self.priceMax = priceMax
        self.priceMin = priceMin
        self.discount = discount
        self.userRating = UserRating(dictionary: userRating)!
        self.category = WishCategory(dictionary: category)!
        self.link = link
    }
}
