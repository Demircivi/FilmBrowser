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
    private static let homeTitle = "Home"
    private static let searchMilliseconds = 300
    
    typealias ViewModelType = HomeViewModel
    
    var viewModel: HomeViewModel!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var messageView: HomeViewControllerMessageView!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = HomeViewController.homeTitle
        
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureTableView() {
        let cellName = TypeHelper.getClassName(HomeTableViewCell.self)
        
        self.tableView.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
    }
    
    func bindedViewModel() {
        bindTableView()
        bindToTableViewSelectedEvents()
        bindMessageView()
        bindToSearchBar()
    }
    
    private func bindTableView() {
        self.viewModel.films.bind(to:
            self.tableView.rx.items(cellIdentifier: TypeHelper.getClassName(HomeTableViewCell.self), cellType: HomeTableViewCell.self)
        ) { row, model, cell in
            let viewModel = HomeTableViewCellViewModel(film: model)
            
            cell.bind(viewModel: viewModel)
        }
        .disposed(by: self.disposeBag)
    }
    
    private func bindToTableViewSelectedEvents() {
        self.tableView.rx.modelSelected(Film.self)
            .subscribe(onNext: { [unowned self] film in
                self.viewModel.goToFilmDetail(with: film)
                
                if let indexPathForSelectedRow = self.tableView.indexPathForSelectedRow {
                    self.tableView.deselectRow(at: indexPathForSelectedRow, animated: true)
                }
            })
            .disposed(by: self.disposeBag)
    }
    
    private func bindMessageView() {
        self.viewModel.message
            .subscribe(onNext: { [unowned self] message in
                guard let message = message else {
                    self.tableView.backgroundView = nil
                    self.tableView.separatorStyle = .singleLine
                    
                    return
                }
                
                self.messageView.messageLabel.text = message
                self.tableView.backgroundView = self.messageView
                self.tableView.separatorStyle = .none
            })
            .disposed(by: self.disposeBag)
    }
    
    private func bindToSearchBar() {
        self.searchBar.rx.text
            .orEmpty
            .filter { !$0.isEmpty }
            .distinctUntilChanged()
            .throttle(RxTimeInterval.milliseconds(HomeViewController.searchMilliseconds), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [unowned self] text in
                self.viewModel.fetch(film: text)
            })
            .disposed(by: self.disposeBag)
    }
}
