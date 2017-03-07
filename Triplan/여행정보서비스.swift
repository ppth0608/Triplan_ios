//
//  여행정보Service.swift
//  Triplan
//
//  Created by Naver on 2017. 3. 7..
//  Copyright © 2017년 Ben. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

enum 여행정보이벤트 {
    case 생성(여행정보)
    case 수정(여행정보)
    case 삭제(id: String)
}

protocol 여행정보서비스타입 {

    var 이벤트: PublishSubject<여행정보이벤트> { get }

    func 데이터갱신() -> Observable<[여행정보]>

    @discardableResult
    func 저장(_ 여행정보: 여행정보) -> Observable<Void>

    @discardableResult
    func 저장(_ 여행정보목록: [여행정보]) -> Observable<Void>
}

final class 여행정보서비스: 기반서비스, 여행정보서비스타입 {

    let 이벤트 = PublishSubject<여행정보이벤트>()

    func 데이터갱신() -> Observable<[여행정보]> {
        do {
            let 여행정보목록 = try Realm().objects(여행정보.self).asObservableArray()
            return 여행정보목록
        } catch let error {
            print(error)
            return .just([])
        }
    }

    @discardableResult
    func 저장(_ 여행정보: 여행정보) -> Observable<Void> {
        여행정보.추가()
        return .empty()
    }

    @discardableResult
    func 저장(_ 여행정보목록: [여행정보]) -> Observable<Void> {
        여행정보목록.forEach { $0.추가() }
        return .empty()
    }
}
