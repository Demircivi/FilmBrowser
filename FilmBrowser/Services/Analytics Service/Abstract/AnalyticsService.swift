//
//  AnalyticsService.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 21.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import Foundation

protocol AnalyticsService {
    func logFilmDetailShownEvent(imdbId: String)
}
