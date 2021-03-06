//
//  Date+Extension.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 12..
//  Copyright © 2016년 Ben. All rights reserved.
//

import Foundation

func == (lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs === rhs || lhs.compare(rhs as Date) == .orderedSame
}

func < (lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs as Date) == .orderedAscending
}
