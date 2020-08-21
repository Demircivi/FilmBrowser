//
//  Transition+PushAsRootViewController.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 19.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import Foundation
import XCoordinator

extension Transition where RootViewController: UINavigationController {
    static func presentFullScreen(_ presentable: Presentable, animation: Animation? = nil) -> Transition {
        guard let viewController = presentable.viewController else {
            fatalError("Failed to get view controller of the presentable")
        }
        
        viewController.modalPresentationStyle = .fullScreen
        
        return .present(presentable, animation: animation)
    }
}
