//
//  Film.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 20.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import Foundation

struct Film: Decodable {
    private static let notAvailablePosterURLValue = "N/A"
    private static let noImageURL = "https://upload.wikimedia.org/wikipedia/commons/0/0a/No-image-available.png"
    
    let title: String
    let year: String
    let imdbId: String
    let type: String
    let posterURL: String
    
    public var sanitizedPosterURL: String {
        return self.posterURL == Film.notAvailablePosterURLValue ? Film.noImageURL : self.posterURL
    }
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case posterURL = "Poster"
    }
}
