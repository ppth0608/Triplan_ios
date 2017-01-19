//
//  여행계획_설정_뷰컨트롤러.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 19..
//  Copyright © 2016년 Ben. All rights reserved.
//

import UIKit

class 상세_설정_뷰컨트롤러: 공통_네비게이션뷰컨트롤러 {

    var 여행정보키값: String?

    deinit {
        NSLog("deinit -- 상세_설정_뷰컨트롤러")
    }
}

// MARK: - UIViewController
extension 상세_설정_뷰컨트롤러 {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func 네비게이션바세팅() {
        title = "설정"
    }
}
