//
//  Store.swift
//
//  Created by Caio Sanchez Christino on 01/12/17.
//  Copyright © 2017 Caio Sanchez Christino. All rights reserved.
//

import Foundation

struct Store {
    let id: Int
    let name: String
    let thumbnail: String
    let ebit: Ebit
    let link: String
    let ocb: Bool;
}

extension Store: JSONDecodable {
    init?(dictionary: JSONDictionary) {
        guard let id = dictionary["id"] as? Int,
            let name = dictionary["name"] as? String,
            let thumbnail = dictionary["thumbnail"] as? String,
            let ebit = dictionary["ebit"] as? JSONDictionary,
            let link = dictionary["link"] as? String,
            let ocb = dictionary["ocb"] as? Bool else {
                return nil
        }
        
        self.id = id
        self.name = name
        self.thumbnail = thumbnail
        self.ebit = Ebit(dictionary: ebit)!
        self.link = link
        self.ocb = ocb
    }
}
