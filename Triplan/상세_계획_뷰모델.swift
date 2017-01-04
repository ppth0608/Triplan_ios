//
//  상세_계획_뷰모델.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 30..
//  Copyright © 2016년 Ben. All rights reserved.
//

import Foundation
import RxSwift
import SwiftyUserDefaults
import RealmSwift

class 상세_계획_뷰모델 {
    
    var 여행정보키 = Variable<String>("")
    var 선택된날짜 = Variable<NSDate>(NSDate())

    var 여행정보데이터: 여행정보?
    
    var 여행계획목록: Results<여행계획>?
    var 여행계획목록감시자: Observable<Results<여행계획>>?
    var 여행계획목록업데스트감시자: Observable<DB노티피케이션상태>?
    
    init() {
        데이터세팅()
        감시자세팅()
    }
}

extension 상세_계획_뷰모델 {
    
    func 데이터세팅() {
        여행정보키.value = Defaults[.활성화여행정보키]
        여행정보데이터 = try! Realm().object(ofType: 여행정보.self, forPrimaryKey: 여행정보키.value)
        여행계획목록 = try! Realm()
            .object(ofType: 여행정보.self, forPrimaryKey: 여행정보키.value)?.여행계획목록
            .sorted(byProperty: "계획날짜", ascending: true)
//            .filter("계획날짜 == %@", 선택된날짜.value)
    }
    
    func 감시자세팅() {
        여행계획목록감시자 = 여행계획목록?.asObservable().filter { $0.1 == .초기화 }.map { $0.0 }
        여행계획목록업데스트감시자 = 여행계획목록?.asObservable().filter { $0.1 == .업데이트 }.map { $0.1 }
    }
}

extension 상세_계획_뷰모델 {
    
    var 네비게이션바타이틀: String {
        return 여행정보데이터?.여행제목 ?? ""
    }
    
    var 테이블뷰높이: CGFloat {
        return 여행계획.cellHeight
    }
    
    var 캘린더최소날짜: Date {
        let 시작일 = 여행정보데이터?.시작일 as Date?
        return 시작일 ?? Date()
    }
    
    var 캘린더최대날짜: Date {
        let 종료일 = 여행정보데이터?.종료일 as Date?
        return 종료일 ?? Date()
    }
    
    func 캘린더날짜선택가능여부(날짜: Date) -> Bool {
        switch 날짜 {
        case let 날짜 where 날짜 < 캘린더최소날짜:
            return false
        case let 날짜 where 날짜 > 캘린더최대날짜:
            return false
        default :
            return true
        }
    }
    
    var 여행계획목록갯수: Int {
        return 여행계획목록?.count ?? 0
    }
    
    func 여행계획데이터(인덱스: Int) -> 여행계획? {
        guard let 여행계획목록 = 여행계획목록, 인덱스 < 여행계획목록.count else {
            return nil
        }
        return 여행계획목록[인덱스]
    }
}
