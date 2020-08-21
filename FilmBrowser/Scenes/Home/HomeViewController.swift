//
//  HomeViewController.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 18.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController, ViewModelBindable {
    typealias ViewModelType = HomeViewModel
    
    var viewModel: HomeViewModel!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
        
        configureTableView()
    }
    
    private func configureTableView() {
        let cellName = TypeHelper.getClassName(HomeTableViewCell.self)
        
        self.tableView.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
    }
    
    func bindedViewModel() {
        bindTableView()
    }
    
    private func bindTableView() {
        self.viewModel.films.bind(to:
            self.tableView.rx.items(cellIdentifier: TypeHelper.getClassName(HomeTableViewCell.self), cellType: HomeTableViewCell.self)
        ) { row, model, cell in
            let viewModel = HomeTableViewCellViewModel(film: model)
            
            cell.bind(viewModel: viewModel)
        }.disposed(by: self.disposeBag)
    }
}
