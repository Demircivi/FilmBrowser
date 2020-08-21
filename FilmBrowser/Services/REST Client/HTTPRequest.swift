//
//  HTTPRequest.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 20.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import Foundation
import Alamofire

protocol HTTPRequest: URLRequestConvertible {
    var method: HTTPMethod { get }
    var baseUrl: String { get }
    var path: String { get }
    var parameters: [String: String] { get }
}

extension HTTPRequest {    
    func asURLRequest() throws -> URLRequest {
        guard var components = URLComponents(string: baseUrl) else {
            fatalError("Failed to create \(TypeHelper.getClassName(URLComponents.self))")
        }
        components.path = self.path
        components.queryItems = self.parameters.map { key, value in
            return URLQueryItem(name: key, value: value)
        }
        
        let url = try components.asURL()
        
        var request = URLRequest(url: url)
        
        request.method = self.method
        
        return request
    }
}
