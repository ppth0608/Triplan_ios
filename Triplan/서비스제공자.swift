//
//  ServiceProvider.swift
//  Triplan
//
//  Created by Naver on 2017. 3. 7..
//  Copyright © 2017년 Ben. All rights reserved.
//

import Foundation

protocol 서비스제공자타입: class {

    var 여행정보: 여행정보서비스타입 { get }
}

final class 서비스제공자: 서비스제공자타입 {

    lazy var 여행정보: 여행정보서비스타입 = 여행정보서비스(provider: self)
}
