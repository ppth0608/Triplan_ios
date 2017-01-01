//
//  Optional_Extension.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 30..
//  Copyright © 2016년 Ben. All rights reserved.
//

import Foundation

protocol StringOptionalProtocol { }
extension String: StringOptionalProtocol { }

extension Optional where Wrapped: StringOptionalProtocol {
    
    var isEmpty: Bool {
        guard let str = self as? String else {
            return true
        }
        return str.isEmpty
    }
    
    var isNotEmpty: Bool {
        return !isEmpty
    }
}
