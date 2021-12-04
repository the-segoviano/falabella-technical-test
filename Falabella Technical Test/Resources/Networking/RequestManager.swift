//
//  RequestManager.swift
//  Falabella Technical Test
//
//  Created by Luis Segoviano on 04/12/21.
//

import UIKit

class RequestManager {
    
    class func fetchCollections(reference: UIViewController,
                                 completion: @escaping (Result<FavoritesResponse, Error>) -> ()
    ){
        HTTPRequestHandler.sharedInstance.fetchDataRequest(url: Endpoint.collections.url,
                                                           method: HTTPMethod.GET,
                                                           reference: reference)
        { result in
            switch result {
            case .success(let data):
                do {
                    let jsonDecoder = JSONDecoder()
                    let personResponse = try jsonDecoder.decode(FavoritesResponse.self, from: data)
                    completion(.success(personResponse))
                }
                catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
