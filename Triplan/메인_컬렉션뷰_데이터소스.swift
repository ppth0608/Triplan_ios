//
//  메인컬렉션뷰데이터소스.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 1..
//  Copyright © 2016년 Ben. All rights reserved.
//

import UIKit

class 메인_컬렉션뷰_데이터소스: NSObject, UICollectionViewDataSource {
    
    var 메인뷰모델 = 메인_뷰모델()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 메인뷰모델.여행정보목록갯수() + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 메인뷰모델.여행정보목록갯수() {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "여행추가", for: indexPath) as! 여행추가_셀
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "여행정보", for: indexPath) as! 여행정보_셀
        cell.여행정보 = 메인뷰모델.여행정보데이터(인덱스: indexPath.item)
        return cell
    }
}
