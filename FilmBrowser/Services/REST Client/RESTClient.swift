//
//  AlamofireRESTClient.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 20.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import Foundation
import RxAlamofire
import RxSwift

class RESTClient<HTTPRequestType: HTTPRequest> {
    func execute<ResponseBodyType: Decodable>(request: HTTPRequestType) -> Single<ResponseBodyType> {
        return (RxAlamofire.requestDecodable(request) as Observable<(HTTPURLResponse, ResponseBodyType)>)
            .map { $0.1 }
            .asSingle()
    }
}
