//
//  AppDelegate+WindowAndCoordinator.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 18.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import UIKit

extension AppDelegate {
    func createWindowAndCoordinator() {
        createRootWindow()
        createRouter()
    }
    
    private func createRootWindow() {
        self.window = UIWindow()
    }
    
    private func createRouter() {
        self.router = AppCoordinator(container: self.container).strongRouter
        self.router.setRoot(for: self.window!)
    }
}
