//
//  CurrencyViewModel.swift
//  hwanewul
//
//  Created by Naver on 2016. 11. 11..
//  Copyright © 2016년 Ben. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Moya

class CurrencyViewModel {
    
    var ratesVariable = Variable<[Rate]>([])
    var baseCountryVariable = Variable<String>("KRW")
    
    var exchangeVariable = Variable<String>("")
    var exchangeObservable: Observable<Double>?
    
    var initialRates = [Rate]()
    
    var provider: RxMoyaProvider<FixerAPI>?
    var currencyAPITracker: CurrencyFixerAPITrackerModel?
    
    let disposeBag = DisposeBag()
    
    init() {
        setupCurrencyAPITracker()
        setupExchangeObservable()
    }
}

extension CurrencyViewModel {
    
    fileprivate func setupCurrencyAPITracker() {
        provider = RxMoyaProvider<FixerAPI>()
        currencyAPITracker = CurrencyFixerAPITrackerModel(provider: provider!, baseCountryVariable: baseCountryVariable)
        
        currencyAPITracker?.trackCurrency()
            .subscribe { dictionary in
                self.ratesVariable.value = []
                dictionary.element?.flatMap { $0 }?.forEach { key, value in
                    self.ratesVariable.value.append(Rate(currencyCode: key, rate: value))
                    self.initialRates.append(Rate(currencyCode: key, rate: value))
                }
            }
            .addDisposableTo(disposeBag)
    }
    
    fileprivate func setupExchangeObservable() {
        exchangeObservable = exchangeVariable
            .asObservable()
            .map { Double($0) ?? 1.0 }
            .filter { $0 != 0.0 }
            .distinctUntilChanged()
        
        exchangeObservable?
            .subscribe { exchange in
                self.ratesVariable.value = self.initialRates.map {
                    return Rate(currencyCode: $0.currencyCode, rate: $0.rate * (exchange.element ?? 1.0))
                }
            }
            .addDisposableTo(disposeBag)
    }
}
