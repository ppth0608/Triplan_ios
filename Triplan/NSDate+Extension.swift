//
//  Date+Extension.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 12..
//  Copyright © 2016년 Ben. All rights reserved.
//

import Foundation

extension NSDate: Comparable { }

public func ==(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs === rhs || lhs.compare(rhs as Date) == .orderedSame
}

public func <(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs as Date) == .orderedAscending
}
