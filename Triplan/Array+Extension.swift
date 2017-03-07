//
//  Array+Extension.swift
//  Triplan
//
//  Created by Naver on 2017. 3. 7..
//  Copyright © 2017년 Ben. All rights reserved.
//

import Foundation

extension Array {

    func accumulate<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) -> Result) -> [Result] {
        var running = initialResult
        return map { next in
            running = nextPartialResult(running, next)
            return running
        }
    }
}
