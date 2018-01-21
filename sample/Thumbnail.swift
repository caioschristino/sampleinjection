//
//  Thumbnail.swift
//
//  Created by Caio Sanchez Christino on 30/11/17.
//  Copyright © 2017 Caio Sanchez Christino. All rights reserved.
//

import Foundation

struct Thumbnail {
    let url: String
    let height: Int!
    let width: Int!
    let otherFormats: [OtherFormat]!
}

extension Thumbnail: JSONDecodable {
    init?(dictionary: JSONDictionary) {
        guard let url = dictionary["url"] as? String,
            let height = dictionary["height"] as? Int!,
            let width = dictionary["width"] as? Int!,
            let otherFormats = dictionary["otherFormats"] as? [JSONDictionary]! else {
                return nil
        }
        
        self.url = url
        self.height = height
        self.width = width
        
        var itens = [OtherFormat]()
        if(otherFormats != nil){
            for item in otherFormats {
                itens.append(OtherFormat(dictionary: item)!)
            }
        }
        
        self.otherFormats = itens
        
    }
}
