//
//  NSObject+Extension.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 27..
//  Copyright © 2016년 Ben. All rights reserved.
//

import Foundation

private var AssociationKey: UInt8 = 0

extension NSObject {

    var object: CellPresentable? {
        set {
            objc_setAssociatedObject(self, &AssociationKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            if let storedObject = objc_getAssociatedObject(self, &AssociationKey) as? CellPresentable {
                return storedObject
            } else {
                return nil
            }
        }
    }
}
