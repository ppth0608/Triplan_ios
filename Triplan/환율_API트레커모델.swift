//
//  CurrencyTrackerModel.Swift
//  hwanewul
//
//  Created by Naver on 2016. 10. 23..
//  Copyright © 2016년 Ben. All rights reserved.
//

import Foundation
import Moya
import Mapper
import Moya_ModelMapper
import RxOptional
import RxSwift

struct CurrencyFixerAPITrackerModel {
    
    let provider: RxMoyaProvider<FixerAPI>
    let baseCountryVariable: Variable<String>
    
    func trackCurrency() -> Observable<[String: Double]?> {
        return baseCountryVariable.asObservable()
            .observeOn(MainScheduler.instance)
            .flatMapLatest { baseCountry -> Observable<[String: Double]?> in
                self.currecy(baseCountry: baseCountry)
            }
    }
    
    fileprivate func currecy(baseCountry: String) -> Observable<[String: Double]?> {
        return provider
            .request(FixerAPI.latestCurrency(base: baseCountry))
            .debug()
            .mapObjectOptional(type: Currency.self)
            .map { $0?.rates }
    }
}
