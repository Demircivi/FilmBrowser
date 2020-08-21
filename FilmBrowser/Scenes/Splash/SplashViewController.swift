//
//  SplashViewController.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 18.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import UIKit
import RxSwift

class SplashViewController: UIViewController, ViewModelBindable {
    typealias ViewModelType = SplashViewModel
    
    var viewModel: SplashViewModel!
    
    @IBOutlet weak var splashLabel: UILabel!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func bindedViewModel() {
        self.viewModel.title
            .bind(to: self.splashLabel.rx.text)
            .disposed(by: self.disposeBag)
        
        self.viewModel.title
            .map({ $0 == nil })
            .bind(to: self.splashLabel.rx.isHidden)
            .disposed(by: self.disposeBag)
    }
}
