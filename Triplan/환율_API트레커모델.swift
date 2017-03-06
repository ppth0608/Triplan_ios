////
////  CurrencyTrackerModel.Swift
////  hwanewul
////
////  Created by Naver on 2016. 10. 23..
////  Copyright © 2016년 Ben. All rights reserved.
////
//
//import Foundation
//import Moya
////import Mapper
////import Moya_ModelMapper
//import RxOptional
//import RxSwift
//
//struct CurrencyFixerAPITrackerModel {
//
//    let provider: RxMoyaProvider<FixerAPI>
//    let baseCountryVariable: Variable<String>
//    let currencyValue = Variable<[String: Double]>([:])
//    let disposeBag = DisposeBag()
//
//    func trackCurrency2() -> Observable<[String: Double]> {
//        return Observable.create { observer in
//            let obsevableCurrency = self.baseCountryVariable.asObservable()
//                .observeOn(MainScheduler.instance)
//                .flatMapLatest { _ -> Observable<[String: Double]> in
////                    self.currecy(baseCountry: baseCountry)
//            }
//            obsevableCurrency.bindTo(self.currencyValue).addDisposableTo(self.disposeBag)
//            print(self.currencyValue.value)
//            observer.onNext(self.currencyValue.value)
//            observer.onCompleted()
//
//            return Disposables.create {
//
//            }
//        }
//    }
//
//    func trackCurrency() -> Observable<[String: Double]> {
//        return baseCountryVariable.asObservable()
//            .observeOn(MainScheduler.instance)
//            .flatMapLatest { _ -> Observable<[String: Double]> in
//                return
////                self.currecy(baseCountry: baseCountry)
//            }
//    }
////
////    fileprivate func currecy(baseCountry: String) -> Observable<[String: Double]> {
////        return provider
////            .request(FixerAPI.latestCurrency(base: baseCountry))
//////            .mapObjectOptional(type: Currency.self)
////            .map { $0?.rates ?? [:] }
////    }
//}
