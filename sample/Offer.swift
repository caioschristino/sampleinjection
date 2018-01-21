//
//  Offer.swift
//
//  Created by Caio Sanchez Christino on 30/11/17.
//  Copyright © 2017 Caio Sanchez Christino. All rights reserved.
//

import Foundation

struct Offer {
    let id: String
    let name: String
    let product: Product
    let category: WishCategory
    let link: String
    let thumbnail: String
    let price: Double
    let discount: Int
    let installment: Installment
    let store: Store
}

extension Offer: JSONDecodable {
    init?(dictionary: JSONDictionary) {
        guard let id = dictionary["id"] as? String,
            let name = dictionary["name"] as? String,
            let product = dictionary["product"] as? JSONDictionary,
            let category = dictionary["category"] as? JSONDictionary,
            let link = dictionary["link"] as? String,
            let thumbnail = dictionary["thumbnail"] as? String,
            let price = dictionary["price"] as? Double,
            let discount = dictionary["discount"] as? Int,
            let installment = dictionary["installment"] as? JSONDictionary,
            let store = dictionary["store"] as? JSONDictionary else {
                return nil
        }
        
        self.id = id
        self.name = name
        self.product = Product(dictionary: product)!
        self.category = WishCategory(dictionary: category)!
        self.link = link
        self.thumbnail = thumbnail
        self.price = price
        self.discount = discount
        self.installment = Installment(dictionary: installment)!
        self.store = Store(dictionary: store)!
    }
}
