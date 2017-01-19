//
//  CurrencyEndPoint.swift
//  hwanewul
//
//  Created by Naver on 2016. 10. 24..
//  Copyright © 2016년 Ben. All rights reserved.
//

import Foundation
import Moya

fileprivate extension String {

    var URLEscapedString: String {
        return self.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlHostAllowed)!
    }
}

// 환율 API
enum FixerAPI {

    case latestCurrency(base: String)
    case dateCurrency(date: String, base: String)
    case combinedCurrency(date: String, base: String, simbols: String)
}

extension FixerAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.fixer.io")!
    }

    var path: String {
        switch self {
        case .latestCurrency(_):
            return "/latest"
        case .dateCurrency(let date, _):
            return "/\(date.URLEscapedString)"
        case .combinedCurrency(let date, _, _):
            return "/\(date.URLEscapedString)"
        }
    }

    var method: Moya.Method {
        return .GET
    }

    var parameters: [String : Any]? {
        switch self {
        case .latestCurrency(let base):
            return ["base": base.URLEscapedString]
        case .dateCurrency(_, let base):
            return ["base": base.URLEscapedString]
        case .combinedCurrency(_, let base, let simbols):
            return ["base": base.URLEscapedString,
                    "symbols": simbols.URLEscapedString]
        }
    }

    var sampleData: Data {
        switch self {
        case .latestCurrency(_):
            return "".data(using: String.Encoding.utf8)!
        case .dateCurrency(_, _):
            return "".data(using: String.Encoding.utf8)!
        case .combinedCurrency(_, _, _):
            return "".data(using: String.Encoding.utf8)!
        }
    }

    var task: Task {
        return .request
    }
}
