//
//  Pagination.swift
//
//  Created by Caio Sanchez Christino on 30/11/17.
//  Copyright © 2017 Caio Sanchez Christino. All rights reserved.
//

import Foundation

import Foundation

struct Pagination {
    let page: Int
    let size: Int
    let totalSize: Int
    let totalPage: Int
}

extension Pagination: JSONDecodable {
    init?(dictionary: JSONDictionary) {
        guard let page = dictionary["page"] as? Int,
            let size = dictionary["size"] as? Int,
            let totalSize = dictionary["totalSize"] as? Int,
            let totalPage = dictionary["totalPage"] as? Int else {
                return nil
        }
        
        self.page = page
        self.size = size
        self.totalPage = totalPage
        self.totalSize = totalSize
    }
}
