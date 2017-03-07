//
//  BaseService.swift
//  Triplan
//
//  Created by Naver on 2017. 3. 7..
//  Copyright © 2017년 Ben. All rights reserved.
//

import Foundation

class 기반서비스 {

    unowned let provider: 서비스제공자타입

    init(provider: 서비스제공자타입) {
        self.provider = provider
    }
}
