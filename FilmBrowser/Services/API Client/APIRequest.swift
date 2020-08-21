//
//  APIRequest.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 20.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import Foundation
import Alamofire

enum APIRequest {
    case searchFilm(name: String)
}

extension APIRequest: HTTPRequest {
    var method: HTTPMethod {
        return .get
    }
    
    var baseUrl: String {
        return APIConstants.baseUrl
    }
    
    var path: String {
        return "/"
    }
    
    var parameters: [String: String] {
        var dictionary: [String: String] = .init(dictionaryLiteral:
            (APIConstants.apiKeyQueryParameter, APIConstants.apiKey)
        )
        
        switch self {
        case let .searchFilm(name):
            dictionary["s"] = name
        }
        
        return dictionary
    }
}
