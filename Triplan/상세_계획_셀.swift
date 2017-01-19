//
//  상세_계획_셀.swift
//  Triplan
//
//  Created by Naver on 2017. 1. 6..
//  Copyright © 2017년 Ben. All rights reserved.
//

import UIKit

class 상세_계획_셀: UITableViewCell {

    @IBOutlet weak var 카테고리이미지뷰: UIImageView!
    @IBOutlet weak var 장소이름: UILabel!
    @IBOutlet weak var 예산: UILabel!
    @IBOutlet weak var 메모: UILabel!
}

extension 상세_계획_셀 {

    override func 셀UI갱신() {
        guard let contents = contents as? 여행계획 else {
            return
        }

        //TODO: 이미지처리
        장소이름.text = contents.장소이름
        예산.text = "\(contents.예산)원"
        메모.text = contents.메모
    }
}
