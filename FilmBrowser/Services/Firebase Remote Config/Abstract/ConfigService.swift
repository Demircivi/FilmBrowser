//
//  ConfigService.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 19.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import Foundation
import RxSwift

protocol ConfigService {
    func getConfigValue(for key: String) -> Single<String>
    
    /*
     * NOTE: I could add more functions for each config value type by utilizing
     * function overloading but I didn't need it.
     */
}
