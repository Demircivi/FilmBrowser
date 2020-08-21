//
//  FirebaseAnalyticsService.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 21.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import Foundation
import FirebaseAnalytics

class FirebaseAnalyticsService: AnalyticsService {
    private static let filmDetailEventKey = "film_detail_shown"
    private static let imdbIdKey = "imdbId"
    
    func logFilmDetailShownEvent(imdbId: String) {
        Analytics.logEvent(
            FirebaseAnalyticsService.filmDetailEventKey,
            parameters: [FirebaseAnalyticsService.imdbIdKey: imdbId]
        )
    }
}
