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
    
    private let apiClient: APIClient
    
    public let films = BehaviorRelay<[Film]>(value: [])
    public let error = BehaviorRelay<String?>(value: nil)
    
    private let disposeBag = DisposeBag()
    
    public init(router: UnownedRouter<HomeRoute>, apiClient: APIClient) {
        self.apiClient = apiClient
        
        super.init(router: router)
    }
    
    override func initialized() {
        fetchFilms()
    }
    
    private func fetchFilms() {
        self.apiClient.searchFilm(name: "nam")
            .subscribe(onSuccess: { response in
                if let error = response.error {
                    self.error.accept(error)
                    
                    return
                }
                
                guard response.isSuccess else {
                    self.error.accept(HomeViewModel.failedMessage)
                    
                    return
                }
                
                guard let films = response.films else {
                    self.error.accept(HomeViewModel.filmsWasNilMessage)
                    
                    return
                }
                
                if self.error.value != nil {
                    self.error.accept(nil)
                }
                
                self.films.accept(films)
            }, onError: { error in
                self.error.accept(HomeViewModel.errorOccurredMessage)
                self.films.accept([])
            })
            .disposed(by: self.disposeBag)
    }
}
