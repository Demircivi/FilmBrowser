//
//  HomeViewModel.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 18.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import Foundation
import XCoordinator
import RxSwift
import RxCocoa

internal class HomeViewModel: ViewModelBase<HomeRoute> {
    private static let failedMessage = "Unknown error"
    private static let filmsWasNilMessage = "Unknown error 2"
    private static let errorOccurredMessage = "Unknown error 3"
    private static let initialMessage = "Try searching something"
    
    private let apiClient: APIClient
    
    public let films = BehaviorRelay<[Film]>(value: [])
    public let message = BehaviorRelay<String?>(value: HomeViewModel.initialMessage)
    
    private let disposeBag = DisposeBag()
    
    public init(router: UnownedRouter<HomeRoute>, apiClient: APIClient) {
        self.apiClient = apiClient
        
        super.init(router: router)
    }
    
    override func initialized() {
        
    }
    
    public func fetch(film name: String) {
        self.apiClient.searchFilm(name: name)
            .subscribe(onSuccess: { response in
                if let error = response.error {
                    self.message.accept(error)
                    self.films.accept([])
                    
                    return
                }
                
                guard response.isSuccess else {
                    self.message.accept(HomeViewModel.failedMessage)
                    self.films.accept([])
                    
                    return
                }
                
                guard let films = response.films else {
                    self.message.accept(HomeViewModel.filmsWasNilMessage)
                    self.films.accept([])
                    
                    return
                }
                
                if self.message.value != nil {
                    self.message.accept(nil)
                }
                
                self.films.accept(films)
            }, onError: { error in
                self.message.accept(HomeViewModel.errorOccurredMessage)
                self.films.accept([])
            })
            .disposed(by: self.disposeBag)
    }
    
    public func goToFilmDetail(with film: Film) {
        self.router.trigger(.filmDetail(film: film))
    }
}
