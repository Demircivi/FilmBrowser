//
//  WrapperAnalyticsService.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 21.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import Foundation

class WrapperAnalyticsService: AnalyticsService {
    private let analyticsServices: [AnalyticsService] = [
        FirebaseAnalyticsService()
    ]
    
    init() {
        
    }
    
    func logFilmDetailShownEvent(imdbId: String) {
        self.analyticsServices.forEach { $0.logFilmDetailShownEvent(imdbId: imdbId) }
    }
}
