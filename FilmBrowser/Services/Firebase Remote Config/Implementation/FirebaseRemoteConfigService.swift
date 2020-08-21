//
//  FirebaseRemoteConfigService.swift
//  FilmBrowser
//
//  Created by Doğu Emre DEMİRÇİVİ on 19.08.2020.
//  Copyright © 2020 Doğu Emre DEMİRÇİVİ. All rights reserved.
//

import Foundation
import FirebaseRemoteConfig
import RxSwift

class FirebaseRemoteConfigService: ConfigService {
    private var instance: RemoteConfig!
    private var fetched: Bool = false
    
    public init() {
        createAndConfigureInstance()
    }
    
    private func createAndConfigureInstance() {
        self.instance = RemoteConfig.remoteConfig()
        
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        
        self.instance.configSettings = settings
    }
    
    private func fetchIfNotFetched() -> Completable {
        return Completable.create { observer in
            if self.fetched {
                observer(.completed)
                
                return Disposables.create()
            }
            
            self.instance.fetch { (status, error) in
                if let error = error {
                    observer(.error(ConfigLoadError.internalError(error: error)))
                    
                    return
                }
                
                guard status == .success else {
                    observer(.error(ConfigLoadError.failedToFetch))
                    
                    return
                }
                
                self.instance.activate { (changed, error) in
                    if let error = error {
                        observer(.error(ConfigLoadError.internalError(error: error)))
                        
                        return
                    }
                    
                    observer(.completed)
                }
            }
            
            // NOTE: There is unfortunately no way to cancel an ongoing fetch request, we're simply returning an empty disposable
            return Disposables.create()
        }
    }
    
    public func getConfigValue(for key: String) -> Single<String> {
        self.fetchIfNotFetched()
            .andThen(Single.create { observer in
                let value = self.instance.configValue(forKey: key)
                
                guard let stringValue = value.stringValue else {
                    observer(.error(ConfigGetError.failedToGet(key: key)))
                    
                    return Disposables.create()
                }
                
                observer(.success(stringValue))
                
                return Disposables.create()
            })
    }
}
