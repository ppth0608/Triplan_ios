//
//  여행추가_뷰모델.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 11..
//  Copyright © 2016년 Ben. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RealmSwift

class 여행추가_뷰모델 {
    
    var 출발날짜 = Variable<Date>(Date())
    var 도착날짜 = Variable<Date>(Date())
    
    var 출발날짜감시자: Observable<String>?
    var 도착날짜감시자: Observable<String>?
    
    var 날짜포멧: DateFormatter = {
        let 포멧 = DateFormatter()
        포멧.dateFormat = "yyyy. M. d"
        return 포멧
    }()
    
    init() {
        감시자세팅()
    }
}

private extension 여행추가_뷰모델 {
    
    func 감시자세팅() {
        출발날짜감시자 = 출발날짜.asObservable().map { self.날짜포멧.string(from: $0) }
        도착날짜감시자 = 도착날짜.asObservable().map { self.날짜포멧.string(from: $0) }
    }
}
