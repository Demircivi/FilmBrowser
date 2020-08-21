//
//  SplashViewModel.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 18.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import Foundation
import XCoordinator
import RxSwift
import RxCocoa
import Reachability

internal class SplashViewModel: ViewModelBase<AppRoute> {
    private static let splashLabelConfigKey = "splash_label"
    private static let splashTimeoutSeconds = 3
    
    private let configService: ConfigService
    private let reachability = Reachability.forInternetConnection()!
    
    public required init(router: UnownedRouter<AppRoute>, configService: ConfigService) {
        self.configService = configService
        
        super.init(router: router)
    }
    
    private let disposeBag = DisposeBag()
    public let title = BehaviorSubject<String?>(value: nil)
    
    public func loaded() {
        if !self.reachability.isReachable() {
            goNoInternet()
            
            return
        }
        
        self.configService
            .getConfigValue(for: SplashViewModel.splashLabelConfigKey)
            .asObservable()
            .do(onCompleted: {
                self.goToHome(after: SplashViewModel.splashTimeoutSeconds)
            })
            .bind(to: self.title)
            .disposed(by: self.disposeBag)
    }
    
    private func goToHome(after seconds: Int) {
        Observable<Int>.timer(RxTimeInterval.seconds(seconds), scheduler: MainScheduler.instance)
            .subscribe(onCompleted: { [unowned self] in self.router.trigger(.home) })
            .disposed(by: self.disposeBag)
    }
    
    private func goNoInternet() {
        self.router.trigger(.noInternet)
    }
}
