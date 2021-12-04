//
//  Endpoint.swift
//  Falabella Technical Test
//
//  Created by Luis Segoviano on 04/12/21.
//

import Foundation

private extension URL {
    static func makeForEndpoint(_ endpoint: String) -> URL {
        let url_base = "https://gist.githubusercontent.com/"
        return URL(string: url_base + endpoint)!
    }
}



enum Endpoint {
    case collections
}


extension Endpoint {
    
    var url: URL {
        switch self {
        
        case .collections:
            return .makeForEndpoint("aletomm90/7ff8e9a7c49aefd06a154fe097028d27/raw/c87e2e7d21313391d412420b4254c391aa68eeec/favorites.json")
            
        }
    }
}



