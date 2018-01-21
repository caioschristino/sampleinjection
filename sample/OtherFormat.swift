//
//  OtherFormat.swift
//
//  Created by Caio Sanchez Christino on 30/11/17.
//  Copyright © 2017 Caio Sanchez Christino. All rights reserved.
//

import Foundation

struct OtherFormat {
    let url: String
    let height: Int
    let width: Int
}

extension OtherFormat: JSONDecodable {
    init?(dictionary: JSONDictionary) {
        guard let url = dictionary["url"] as? String,
            let height = dictionary["height"] as? Int,
            let width = dictionary["width"] as? Int else {
                return nil
        }
        
        self.url = url
        self.height = height
        self.width = width
    }
}
