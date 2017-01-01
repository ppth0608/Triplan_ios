//
//  상세_뷰컨트롤러.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 19..
//  Copyright © 2016년 Ben. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

class 상세_계획_뷰컨트롤러: 공통_뷰컨트롤러 {
    
    var 여행정보키값: String? {
        didSet {
            print(여행정보키값)
        }
    }

    deinit {
        NSLog("deinit -- 상세_계획_뷰컨트롤러")
    }
}

// MARK: - UIViewController
extension 상세_계획_뷰컨트롤러 {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        여행정보키값 = Defaults[.활성화여행정보키]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func 네비게이션바세팅() {
        title = "계획"
    }
}
