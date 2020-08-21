//
//  TypeHelper.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 18.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import Foundation

class TypeHelper {
    public static func getClassName<ClassType>(_ classType: ClassType) -> String {
        return String(describing: classType.self)
    }
}
