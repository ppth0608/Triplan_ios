//
//  여행_계획.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 11..
//  Copyright © 2016년 Ben. All rights reserved.
//

import Foundation
import RealmSwift

enum 계획세부종류: String {

    case 교통, 맛집, 명소, 숙박, 기타
}

class 여행계획: Object {

    dynamic var 여행계획키 = NSUUID().uuidString
    dynamic var 여행제목 = ""
    dynamic var 계획날짜 = NSDate()
    dynamic var 세부카테고리값 = 계획세부종류.교통.rawValue
    var 세부카테고리: 계획세부종류 {
        get {
            return 계획세부종류(rawValue: 세부카테고리값)!
        } set {
            세부카테고리값 = newValue.rawValue
        }
    }
    dynamic var 장소이름 = ""
    dynamic var 예산 = 0
    dynamic var 메모 = ""

    override static func primaryKey() -> String? {
        return "여행계획키"
    }
}

extension 여행계획: TableViewCellPresentable {

    static var cellHeight: CGFloat {
        return 100
    }
}
