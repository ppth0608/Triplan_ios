//
//  알림창.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 13..
//  Copyright © 2016년 Ben. All rights reserved.
//

import Foundation
import PKHUD
import RxSwift

extension PKHUD {

    var rx_로딩뷰애니메이션: AnyObserver<Bool> {
        return AnyObserver { 이벤트 in
            MainScheduler.ensureExecutingOnScheduler()
            switch 이벤트 {
            case .next(let value):
                if value {
                    PKHUD.sharedHUD.contentView = PKHUDProgressView(title: "로딩중...", subtitle: nil)
                    PKHUD.sharedHUD.show()
                } else {
                    PKHUD.sharedHUD.hide()
                }
            case .error(let error):
                print(error)
                fatalError("\(error)")
            case .completed:
                break
            }
        }
    }
}
