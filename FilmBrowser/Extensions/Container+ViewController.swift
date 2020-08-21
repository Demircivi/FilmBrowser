//
//  Container+RegisterViewController.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 18.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import Foundation
import XCoordinator
import class Swinject.Container
import class Swinject.ServiceEntry

extension Container {
    typealias ViewModelBindableViewController = UIViewController & ViewModelBindable
    
    @discardableResult
    func registerViewController<
        ViewControllerType: ViewModelBindableViewController
    >(
        type viewControllerType: ViewControllerType.Type
    ) -> Swinject.ServiceEntry<ViewControllerType> {
        return register(ViewControllerType.self) { (resolver, viewModel: ViewControllerType.ViewModelType) in
            let viewController = ViewControllerType()
            viewController.bind(viewModel: viewModel)
            
            return viewController
        }
    }
    
    func resolveViewControllerOrThrow<ViewControllerType: ViewModelBindableViewController>(_ viewControllerType: ViewControllerType.Type, viewModel: ViewControllerType.ViewModelType) -> ViewControllerType {
        return self.resolveOrThrow(viewControllerType, argument: viewModel)
    }
}
