//
//  APIClient.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 20.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import Foundation
import RxSwift

class APIClient {
    private let restClient: RESTClient<APIRequest>
    
    public init(restClient: RESTClient<APIRequest>) {
        self.restClient = restClient
    }
    
    public func searchFilm(name: String) -> Single<SearchFilmResponse> {
        return self.restClient.execute(request: .searchFilm(name: name))
    }
}
