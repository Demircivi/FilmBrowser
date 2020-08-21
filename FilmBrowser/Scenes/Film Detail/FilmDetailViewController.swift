//
//  FilmDetailViewController.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 18.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import UIKit

class FilmDetailViewController: UIViewController, ViewModelBindable {
    typealias ViewModelType = FilmDetailViewModel
    
    var viewModel: FilmDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func bindedViewModel() {
        
    }
}
