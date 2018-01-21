//
//  RequestOffer.swift
//
//  Created by Caio Sanchez Christino on 01/12/17.
//  Copyright © 2017 Caio Sanchez Christino. All rights reserved.
//

import Foundation

struct RequestOffer {
    let requestInfo: RequestInfo
    let pagination: Pagination
    let offers: [Offer];
}

extension RequestOffer: JSONDecodable {
    init?(dictionary: JSONDictionary) {
        guard let requestInfo = dictionary["requestInfo"] as? JSONDictionary,
            let pagination = dictionary["pagination"] as? JSONDictionary,
            let offers = dictionary["offers"] as? [JSONDictionary] else {
                return nil
        }
        
        self.requestInfo = RequestInfo(dictionary: requestInfo)!
        self.pagination = Pagination(dictionary: pagination)!
        
        var itens = [Offer]()
        for item in offers {
            itens.append(Offer(dictionary: item)!)
        }
        self.offers = itens
    }
}
