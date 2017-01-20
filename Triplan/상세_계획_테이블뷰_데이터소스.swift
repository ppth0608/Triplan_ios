//
//  상세_계획_테이블뷰_데이터소스.swift
//  Triplan
//
//  Created by Naver on 2017. 1. 6..
//  Copyright © 2017년 Ben. All rights reserved.
//

import UIKit

class 상세_계획_테이블뷰_데이터소스: NSObject, UITableViewDataSource {

    let 상세계획뷰모델 = 상세_계획_뷰모델()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 상세계획뷰모델.여행계획목록갯수 + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let 여행계획추가인덱스임 = indexPath.row == 상세계획뷰모델.여행계획목록갯수
        if 여행계획추가인덱스임 {
            return tableView.dequeueReusableCell(withIdentifier: "여행계획추가", for: indexPath) as! 상세_계획_추가_셀
        }

        if let 여행계획 = 상세계획뷰모델.여행계획데이터(인덱스: indexPath.row) {
            let cell = 여행계획.cell(from: tableView, with: indexPath)
            여행계획.셀컨텐츠세팅(with: cell)
            return cell
        }
        return UITableViewCell()
    }
}
