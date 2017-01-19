//
//  Currency.swift
//  hwanewul
//
//  Created by Naver on 2016. 10. 24..
//  Copyright © 2016년 Ben. All rights reserved.
//

import Foundation
import Mapper

struct Currency: Mappable {

    let baseCurrency: String
    let date: String
    var rates: [String: Double]

    init() {
        baseCurrency = "KRW"
        date = "2015-01-01"
        rates = [:]
    }

    init(map: Mapper) throws {
        try baseCurrency = map.from("base")
        try date = map.from("date")
        try rates = map.from("rates")
    }
}

struct Rate {

    let currencyCode: String
    var rate: Double
}
