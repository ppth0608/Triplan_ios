//
//  여행추가_컬렉션뷰_셀.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 3..
//  Copyright © 2016년 Ben. All rights reserved.
//

import UIKit

class 여행추가_셀: UICollectionViewCell {
    
    @IBOutlet weak var 스탬프이미지: UIImageView! {
        didSet {
            스탬프이미지.image = UIImage(named: "main_stamp_add")
        }
    }
}
