//
//  Film.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 20.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import Foundation

struct Film: Decodable {
    let title: String
    let year: String
    let imdbId: String
    let type: String
    let posterUrl: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case posterUrl = "Poster"
    }
}
