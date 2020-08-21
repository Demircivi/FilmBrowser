//
//  String+EqualsCaseInsensitive.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 20.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import Foundation

extension String {
    func equalsCaseInsensitive(_ otherString: Self) -> Bool {
        return self.caseInsensitiveCompare(otherString) == .orderedSame
    }
}
