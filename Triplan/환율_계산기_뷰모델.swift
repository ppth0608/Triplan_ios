//
//  CalculatorViewModel.swift
//  hwanewul
//
//  Created by Naver on 2016. 11. 15..
//  Copyright © 2016년 Ben. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CalculatorViewModel {
    
    var inputVariable = Variable<String>("")
    var appendedInputVariable = Variable<String>("")
    var inputObservable: Observable<Double>?
    
    let disposeBag = DisposeBag()
    
    init() {
        setupInputObservable()
    }
}

extension CalculatorViewModel {
    
    func clearValue() {
        inputVariable.value = ""
        appendedInputVariable.value = ""
    }
    
    func setupInputObservable() {
        inputVariable
            .asObservable()
            .subscribe {
                self.appendedInputVariable.value.append($0.element!)
            }
            .addDisposableTo(disposeBag)
        
        
        inputObservable = appendedInputVariable
            .asObservable()
            .map {
                Double($0) ?? 0.0
            }
            .filter { $0 != 0.0 }
    }
}
