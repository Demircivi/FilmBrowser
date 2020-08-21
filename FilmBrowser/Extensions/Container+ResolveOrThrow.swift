//
//  Container+ResolveOrThrow.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 20.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import Foundation
import Swinject

extension Container {
    public func resolveOrThrow<Service>(_ serviceType: Service.Type) -> Service {
        guard let dependency = resolve(serviceType) else {
            fatalError("Failed to resolve \(TypeHelper.getClassName(serviceType))")
        }
        
        return dependency
    }

    public func resolveOrThrow<Service, Arg1>(_ serviceType: Service.Type, argument: Arg1) -> Service {
        guard let dependency = resolve(serviceType, argument: argument) else {
            fatalError("Failed to resolve \(TypeHelper.getClassName(serviceType))")
        }
        
        return dependency
    }
}
