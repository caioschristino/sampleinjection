//
//  OffersAPI.swift
//
//  Created by Caio Sanchez Christino on 30/11/17.
//  Copyright © 2017 Caio Sanchez Christino. All rights reserved.
//

import Foundation
import RxSwift

enum OffersAPI {
    case NoArg
    case Name(name: String)
    case AlphaCodes(codes: [String])
}

extension OffersAPI: Resource {
    var path: String {
        switch self {
        case let .Name(name):
            return "name/\(name)"
        case .AlphaCodes:
            return "alpha"
        default:
            return ""
        }
    }
    
    var parameters: [String: String] {
        switch self {
        case .Name:
            return ["fullText": "true"]
        case let .AlphaCodes(codes):
            return ["codes": codes.joined(separator: ";")]
        default:
            return ["": ""]
        }
    }
}

extension NSURL {
    class func getURL() -> NSURL {
        return NSURL(string: "https://sandbox-api.lomadee.com/v2/1511802137422ab7964de/offer/_bestsellers?sourceId=35894859")!
    }
}

extension APIClient {
    class func getAPI() -> APIClient {
        return APIClient(baseURL: NSURL.getURL())
    }
    
    func findByName(name: String) -> Observable<RequestOffer> {
        return filtre(resource: OffersAPI.Name(name: name)).map { $0[0] }
    }
    
    func getAll() -> Observable<RequestOffer> {
        return filtre(resource: OffersAPI.NoArg)
    }
}
