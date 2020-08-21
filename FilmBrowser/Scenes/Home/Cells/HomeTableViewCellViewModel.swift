//
//  HomeTableViewCellViewModel.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 20.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Kingfisher

class HomeTableViewCellViewModel {
    public let imageResource = BehaviorRelay<Kingfisher.Resource?>(value: nil)
    public let title: BehaviorRelay<String>
    public let type: BehaviorRelay<String>
    public let year: BehaviorRelay<String>
    
    public init(film: Film) {
        if let imageURLString = film.sanitizedPosterURL {
            guard let imageURL = URL(string: imageURLString) else {
                fatalError("Failed to convert poster URL to URL")
            }
            
            self.imageResource.accept(imageURL)
        }
        
        self.title = BehaviorRelay(value: film.title)
        self.type = BehaviorRelay(value: film.type)
        self.year = BehaviorRelay(value: film.year)
    }
}
