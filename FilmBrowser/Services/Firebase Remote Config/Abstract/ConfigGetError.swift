//
//  ConfigGetError.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 19.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import Foundation

enum ConfigGetError: Error {
    case failedToGet(key: String)
    case configLoad(error: ConfigLoadError)
}
