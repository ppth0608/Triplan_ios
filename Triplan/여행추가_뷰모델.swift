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

enum 여행추가유효성결과 {

    case 성공
    case 제목없음
    case 날짜비매칭
}

class 여행추가_뷰모델 {

    var 여행제목 = Variable<String>("")
    var 출발날짜 = Variable<NSDate>(NSDate())
    var 도착날짜 = Variable<NSDate>(NSDate())

    var 출발날짜감시자: Observable<String>?
    var 도착날짜감시자: Observable<String>?
    var 여행추가유효성감시자: Observable<여행추가유효성결과>?

    var 날짜포멧: DateFormatter = {
        let 포멧 = DateFormatter()
        포멧.dateFormat = "yyyy. M. d"
        return 포멧
    }()

    init() {
        감시자세팅()
    }
}

extension 여행추가_뷰모델 {

    func 여행추가() {
        let 추가할여행정보 = 여행정보()
        추가할여행정보.여행제목 = 여행제목.value
        추가할여행정보.시작일 = 출발날짜.value
        추가할여행정보.종료일 = 도착날짜.value
        추가할여행정보.추가()
    }
}

private extension 여행추가_뷰모델 {

    func 감시자세팅() {
        출발날짜감시자 = 출발날짜.asObservable().map { self.날짜포멧.string(from: $0 as Date) }
        도착날짜감시자 = 도착날짜.asObservable().map { self.날짜포멧.string(from: $0 as Date) }
        여행추가유효성감시자 = Observable.combineLatest(여행제목.asObservable(), 출발날짜.asObservable(), 도착날짜.asObservable()) { 여행제목, 출발날짜, 도착날짜 in
            guard !여행제목.isEmpty else {
                return .제목없음
            }
            guard 출발날짜 < 도착날짜 else {
                return .날짜비매칭
            }
            return .성공
        }
    }
}
