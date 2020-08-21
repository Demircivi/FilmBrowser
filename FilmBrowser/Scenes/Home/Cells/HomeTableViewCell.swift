//
//  HomeTableViewCell.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 20.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxKingfisher

class HomeTableViewCell: UITableViewCell, ViewModelBindable {
    typealias ViewModelType = HomeTableViewCellViewModel
    
    var viewModel: HomeTableViewCellViewModel!
    
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var filmImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    func bindedViewModel() {
        self.viewModel.imageURL
            .bind(to: self.filmImageView.kf.rx.image())
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
