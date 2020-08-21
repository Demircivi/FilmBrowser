//
//  ViewModelBase.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 18.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import Foundation
import XCoordinator

internal class ViewModelBase<RouteType: Route> {
    internal let router: UnownedRouter<RouteType>
    
    public init(router: UnownedRouter<RouteType>) {
        self.router = router
        
        initialized()
    }
    
    internal func initialized() {
        
    }
}
