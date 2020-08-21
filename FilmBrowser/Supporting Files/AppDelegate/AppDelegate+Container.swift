//
//  AppDelegate+Container.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 18.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

extension AppDelegate {
    func createContainerAndRegisterComponents() {
        self.container = Container()
        
        registerComponents()
    }
    
    private func registerComponents() {
        registerViewControllers()
        registerServices()
    }
    
    private func registerViewControllers() {
        self.container.registerViewController(type: SplashViewController.self)
        self.container.registerViewController(type: HomeViewController.self)
        self.container.registerViewController(type: FilmDetailViewController.self)
    }
    
    private func registerServices() {
        self.container.autoregister(RESTClient<APIRequest>.self, initializer: RESTClient<APIRequest>.init)
        self.container.autoregister(APIClient.self) { (restClient: RESTClient<APIRequest>) in
            return APIClient(restClient: restClient)
        }
        self.container.autoregister(ConfigService.self, initializer: FirebaseRemoteConfigService.init)
    }
}
