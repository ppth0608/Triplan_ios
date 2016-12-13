//
//  여행정보.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 11..
//  Copyright © 2016년 Ben. All rights reserved.
//

import UIKit
import RealmSwift

enum 스탬프종류: String {
    
    case 없음, 케이블카, 한라산, 요트, 갈대숲, 남산, 대나무, 해변, 대교, 버섯, 첨성대, 열기구, 협곡, 기와집, 매타세콰이어길, 동물, 별장, 기념비, 화성, 조형물, 기차
}

class 여행정보: Object {
    
    dynamic var 여행정보키 = NSUUID().uuidString
    dynamic var 여행제목 = ""
    dynamic var 시작일 = NSDate()
    dynamic var 종료일 = NSDate()
    dynamic var 스탬프카테고리값 = 스탬프종류.없음.rawValue
    var 스탬프카테고리: 스탬프종류 {
        get {
            return 스탬프종류(rawValue: 스탬프카테고리값)!
        } set {
            스탬프카테고리값 = newValue.rawValue
        }
    }
    var 스탬프썸네일: String {
        return "stamp-1"
    }
    
    let 여행계획목록 = List<여행계획>()
    
    override static func primaryKey() -> String? {
        return "여행정보키"
    }
}

extension 여행정보: CollectionViewCellPresentable {
    
    var cellIndentifier: String {
        return "여행정보"
    }
    
    static var cellHeight: CGFloat {
        return 160
    }
    
    static var cellWidth: CGFloat {
        return UIScreen.main.bounds.width / 2 - 10
    }
    
    func cell(from collectionView: UICollectionView, with indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellIndentifier, for: indexPath) as! 여행정보_셀
    }
    
    func updateUI(with cell: UICollectionViewCell, contents: 여행정보) {
        if let cell = cell as? 여행정보_셀 {
            cell.여행정보 = contents
        }
    }
}
