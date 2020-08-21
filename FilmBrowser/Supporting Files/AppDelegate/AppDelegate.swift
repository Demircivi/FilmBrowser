//
//  AppDelegate.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 18.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import UIKit
import XCoordinator
import class Swinject.Container

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var router: StrongRouter<AppRoute>!
    var container: Container!
    
    lazy var loadFunctions: [() -> Void] = [
        configureFirebase,
        createContainerAndRegisterComponents,
        createWindowAndCoordinator
    ]
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        callLoadFunctions()
        
        return true
    }
    
    private func callLoadFunctions() {
        loadFunctions.forEach { $0() }
    }
}
