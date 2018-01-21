//
//  Installment.swift
//
//  Created by Caio Sanchez Christino on 01/12/17.
//  Copyright © 2017 Caio Sanchez Christino. All rights reserved.
//

import Foundation

struct Installment {
    let quantity: Int!
    let value: Double!
}

extension Installment: JSONDecodable {
    init?(dictionary: JSONDictionary) {
        guard let quantity = dictionary["quantity"] as? Int!,
            let value = dictionary["value"] as? Double! else {
                return nil
        }
        
        self.quantity = quantity
        self.value = value
    }
}
