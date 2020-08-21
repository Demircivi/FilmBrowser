//
//  ViewModelBindable.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 18.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import UIKit

protocol ViewModelBindable: AnyObject {
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! { get set }
    
    func bindedViewModel()
}

extension ViewModelBindable where Self: UIViewController {
    func bind(viewModel: ViewModelType) {
        self.viewModel = viewModel
        loadViewIfNeeded()
        bindedViewModel()
    }
}

extension ViewModelBindable where Self: UITableViewCell {
    func bind(viewModel: ViewModelType) {
        self.viewModel = viewModel
        bindedViewModel()
    }
}
