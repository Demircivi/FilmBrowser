//
//  FilmDetailViewModel.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 18.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import Foundation
import XCoordinator
import RxSwift
import RxCocoa
import Kingfisher

internal class FilmDetailViewModel: ViewModelBase<HomeRoute> {
    private let analyticsService: AnalyticsService
    
    public let imageResource: BehaviorRelay<Kingfisher.Resource>
    public let title: BehaviorRelay<String>
    public let type: BehaviorRelay<String>
    public let year: BehaviorRelay<String>
    private let imdbId: String
    
    public init(router: UnownedRouter<HomeRoute>, film: Film, analyticsService: AnalyticsService) {
        guard let imageURL = URL(string: film.sanitizedPosterURL) else {
            fatalError("Failed to convert poster URL to URL")
        }
        
        self.imageResource = BehaviorRelay(value: imageURL)
        self.title = BehaviorRelay(value: film.title)
        self.type = BehaviorRelay(value: film.type)
        self.year = BehaviorRelay(value: film.year)
        self.imdbId = film.imdbId
        
        self.analyticsService = analyticsService
        
        super.init(router: router)
    }
    
    public func logShownEvent() {
        self.analyticsService.logFilmDetailShownEvent(imdbId: self.imdbId)
    }
}
