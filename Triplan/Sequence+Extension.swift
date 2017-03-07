//
//  Sequence+Extension.swift
//  Triplan
//
//  Created by Naver on 2017. 3. 7..
//  Copyright © 2017년 Ben. All rights reserved.
//

import Foundation

extension Sequence {

    func last(where predicate: (Iterator.Element) -> Bool) -> Iterator.Element? {
        for element in reversed() where predicate(element) {
            return element
        }
        return nil
    }

    func all(matching predicated: (Iterator.Element) -> Bool) -> Bool {
        return !contains { !predicated($0) }
    }
}

extension Sequence where Iterator.Element: Hashable {

    func unique() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        return filter {
            if seen.contains($0) {
                return false
            } else {
                seen.insert($0)
                return true
            }
        }
    }
}
