//
//  APIClient.swift
//
//  Created by Caio Sanchez Christino on 30/11/17.
//  Copyright © 2017 Caio Sanchez Christino. All rights reserved.
//

import Foundation
import RxSwift

enum APIClientError: Error {
    case CouldNotDecodeJSON
    case BadStatus(status: Int)
    case Other(NSError)
}

extension APIClientError: CustomDebugStringConvertible {
    var debugDescription: String {
        switch self {
        case .CouldNotDecodeJSON:
            return "Could not decode JSON"
        case let .BadStatus(status):
            return "Bad status \(status)"
        case let .Other(error):
            return "\(error)"
        }
    }
}

final class APIClient {
    init(baseURL: NSURL, configuration: URLSessionConfiguration = URLSessionConfiguration.default) {
        self.baseURL = baseURL
        self.session = URLSession(configuration: configuration)
    }
    
    func filtre<T: JSONDecodable>(resource: Resource) -> Observable<[T]> {
        return data(resource: resource).map { data in
            guard let objects: [T] = decode(data: data) else {
                throw APIClientError.CouldNotDecodeJSON
            }
            
            return objects
        }}
    
    
    func filtre<T: JSONDecodable>(resource: Resource) -> Observable<T> {
        return data(resource: resource).map { data in
            guard let objects: T = decode(data: data) else {
                throw APIClientError.CouldNotDecodeJSON
            }
            
            return objects
        }}
    
    // MARK: - Private
    private let baseURL: NSURL
    private let session: URLSession
    private func data(resource: Resource) -> Observable<NSData> {
        let request = resource.requestWithBaseURL(baseURL: baseURL)
        
        return Observable.create { observer in
            let task = self.session.dataTask(with: request as URLRequest) { data, response, error in
                
                if let error = error {
                    observer.onError(APIClientError.Other(error as NSError))
                } else {
                    guard let HTTPResponse = response as? HTTPURLResponse else {
                        fatalError("Couldn't get HTTP response")
                    }
                    
                    if 200 ..< 300 ~= HTTPResponse.statusCode {
                        observer.onNext(data! as NSData)
                        observer.onCompleted()
                    }
                    else {
                        observer.onError(APIClientError.BadStatus(status: HTTPResponse.statusCode))
                    }
                }
            }
            
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
