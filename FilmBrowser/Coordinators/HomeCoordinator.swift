//
//  HomeCoordinator.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 18.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import Foundation
import XCoordinator
import class Swinject.Container

internal enum HomeRoute: Route {
    case home
    case filmDetail(imdbId: String)
}

internal class HomeCoordinator: NavigationCoordinator<HomeRoute> {
    private let container: Container
    
    public init(container: Container) {
        self.container = container
        
        super.init(initialRoute: .home)
    }
    
    override func prepareTransition(for route: HomeRoute) -> NavigationTransition {
        switch route {
        case .home:
            return getHomeTransition(for: route)
            
        case let .filmDetail(imdbId):
            return getFilmDetailTransition(for: route, imdbId: imdbId)
        }
    }
    
    private func getHomeTransition(for route: HomeRoute) -> NavigationTransition {
        let apiClient = self.container.resolveOrThrow(APIClient.self)
        let viewModel = HomeViewModel(router: unownedRouter, apiClient: apiClient)
        let viewController = self.container.resolveViewControllerOrThrow(HomeViewController.self, viewModel: viewModel)
        
        return .push(viewController)
    }
    
    private func getFilmDetailTransition(for route: Route, imdbId: String) -> NavigationTransition {
        let viewModel = FilmDetailViewModel(router: unownedRouter)
        let viewController = self.container.resolveViewControllerOrThrow(FilmDetailViewController.self, viewModel: viewModel)
        
        return .push(viewController)
    }
}
