//
//  FilmDetailViewController.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 18.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class FilmDetailViewController: UIViewController, ViewModelBindable {
    typealias ViewModelType = FilmDetailViewModel
    
    var viewModel: FilmDetailViewModel!
    
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.viewModel.logShownEvent()
    }
    
    func bindedViewModel() {
        bindComponents()
    }
    
    private func bindComponents() {
        self.viewModel.title
            .bind(to: self.rx.title)
            .disposed(by: self.disposeBag)
        
        self.viewModel.imageResource
            .bind(to: self.imageView.kf.rx.image())
            .disposed(by: self.disposeBag)
        
        self.viewModel.title
            .bind(to: self.titleLabel.rx.text)
            .disposed(by: self.disposeBag)
        
        self.viewModel.type
            .bind(to: self.typeLabel.rx.text)
            .disposed(by: self.disposeBag)
        
        self.viewModel.year
            .bind(to: self.yearLabel.rx.text)
            .disposed(by: self.disposeBag)
    }
}
