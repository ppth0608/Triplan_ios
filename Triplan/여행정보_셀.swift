//
//  여행정보_컬렉션뷰_셀.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 3..
//  Copyright © 2016년 Ben. All rights reserved.
//

import UIKit

class 여행정보_셀: UICollectionViewCell {
    
    @IBOutlet fileprivate weak var 스탬프이미지뷰: UIImageView!
    @IBOutlet fileprivate weak var 여행제목: UILabel!
}

extension 여행정보_셀 {
    
    override func 셀UI갱신() {
        guard let contents = contents as? 여행정보 else {
            return
        }
        
        스탬프이미지뷰.image = UIImage(named: contents.스탬프썸네일)
        여행제목.text = contents.여행제목
    }
}
