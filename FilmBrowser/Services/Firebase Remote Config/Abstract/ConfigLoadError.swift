//
//  ConfigLoadError.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 19.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import Foundation

enum ConfigLoadError: Error {
    case internalError(error: Error)
    case failedToFetch
}
