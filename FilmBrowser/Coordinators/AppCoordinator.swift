//
//  AppCoordinator.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 18.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import Foundation
import XCoordinator
import class Swinject.Container

internal enum AppRoute: Route {
    case splash
    case noInternet
    case home
}

internal class AppCoordinator: NavigationCoordinator<AppRoute> {
    private static let noInternetTitle = "No internet"
    private static let noInternetDescription = "Cannot reach to the internet, please check your connection"
    
    private let container: Container
    
    public init(container: Container) {
        self.container = container
        
        super.init(initialRoute: .splash)
    }
    
    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        switch route {
        case .splash:
            return getSplashTransition(for: route)
        
        case .noInternet:
            return getNoInternetTransition()
        
        case .home:
            return getHomeTransition(for: route)
        }
    }
    
    private func getSplashTransition(for route: AppRoute) -> NavigationTransition {
        let configService = self.container.resolveOrThrow(ConfigService.self)
        
        let viewModel = SplashViewModel(router: unownedRouter, configService: configService)
        let viewController = self.container.resolveViewControllerOrThrow(SplashViewController.self, viewModel: viewModel)
        
        return .push(viewController)
    }
    
    private func getNoInternetTransition() -> NavigationTransition {
        let viewController = UIAlertController(
            title: AppCoordinator.noInternetTitle,
            message: AppCoordinator.noInternetDescription,
            preferredStyle: .alert
        )
        
        return .present(viewController)
    }
    
    private func getHomeTransition(for route: AppRoute) -> NavigationTransition {
        let router = HomeCoordinator(container: self.container)
        
        return .presentFullScreen(router)
    }
}
