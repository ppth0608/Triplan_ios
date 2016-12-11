//
//  메인_뷰모델.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 4..
//  Copyright © 2016년 Ben. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RealmSwift

class 메인_뷰모델 {
    
    var 여행정보목록: Variable<[여행정보]>?
    
    init() {
        데이터갱신()
    }
}

extension 메인_뷰모델 {
    
    func 데이터갱신() {
        여행정보목록?.value = try! Realm().objects(여행정보.self).map { $0 }
    }
    
    var 컬렉션뷰너비: CGFloat {
        return 여행정보.cellWidth
    }
    
    var 컬렉션뷰높이: CGFloat {
        return 여행정보.cellHeight
    }
    
    func 여행정보목록갯수() -> Int {
        return 여행정보목록?.value.count ?? 0
    }
    
    func 여행정보데이터(인덱스: Int) -> 여행정보? {
        guard let 여행정보목록 = 여행정보목록, 인덱스 < 여행정보목록.value.count else {
            return nil
        }
        return 여행정보목록.value[인덱스]
    }
}
