//
//  SearchFilmResponse.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 20.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import Foundation

struct SearchFilmResponse: Decodable {
    private static let responseTrue = "True"
    
    private let response: String
    let error: String?
    let films: [Film]?
    
    var isSuccess: Bool {
        return response.equalsCaseInsensitive(SearchFilmResponse.responseTrue)
    }
    
    enum CodingKeys: String, CodingKey {
        case response = "Response"
        case error = "Error"
        case films = "Search"
    }
}
