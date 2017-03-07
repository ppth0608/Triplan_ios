//
//  ModelType.swift
//  Triplan
//
//  Created by Naver on 2017. 3. 7..
//  Copyright © 2017년 Ben. All rights reserved.
//

import Foundation

protocol Identifiable {

    associatedtype Identifier: Equatable
    var id: Identifier { get }
}

extension Collection where Self.Iterator.Element: Identifiable {

    func index(of element: Self.Iterator.Element) -> Self.Index? {
        return self.index { $0.id == element.id }
    }
}
