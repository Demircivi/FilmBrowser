//
//  Reactive+MBProgressHUD.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 20.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import JGProgressHUD

extension ObservableType {
    func showHUDWhileExecuting() -> RxSwift.Observable<Self.Element> {
        guard let view = UIApplication.shared.firstKeyWindow?.subviews.last else {
            fatalError("Failed to get view to present HUD on")
        }
        
        var hud: JGProgressHUD!
        
        return self
            .do(onSubscribed: {
                hud = JGProgressHUD()
                hud.show(in: view)
            })
            .do(onError: { _ in
                hud.dismiss()
            }, onCompleted: {
                hud.dismiss()
            })
    }
}

