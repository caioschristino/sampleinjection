//
//  JSONDecodable.swift
//
//  Created by Caio Sanchez Christino on 30/11/17.
//  Copyright © 2017 Caio Sanchez Christino. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String: AnyObject]

protocol JSONDecodable {
    init?(dictionary: JSONDictionary)
}

func decode<T: JSONDecodable>(dictionaries: [JSONDictionary]) -> [T] {
    return dictionaries.flatMap { T(dictionary: $0) }
}

func decode<T: JSONDecodable>(dictionary: JSONDictionary) -> T? {
    return T(dictionary: dictionary)
}

func decode<T:JSONDecodable>(data: NSData) -> [T]? {
    guard let JSONObject = try? JSONSerialization.jsonObject(with: data as Data, options: []),
        let dictionaries = JSONObject as? [JSONDictionary],
        let objects: [T] = decode(dictionaries: dictionaries) else {
            return nil
    }
    return objects
}

func decode<T:JSONDecodable>(data: NSData) -> T? {
    guard let JSONObject = try? JSONSerialization.jsonObject(with: data as Data, options: []),
        let dictionary = JSONObject as? JSONDictionary,
        let objects: T = decode(dictionary: dictionary) else {
            return nil
    }
    return objects
}
