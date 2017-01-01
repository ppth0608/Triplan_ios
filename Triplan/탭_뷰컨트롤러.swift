//
//  탭_뷰컨트롤러.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 19..
//  Copyright © 2016년 Ben. All rights reserved.
//

import UIKit

class 탭_뷰컨트롤러: UITabBarController {
    
    deinit {
        NSLog("deinit -- 탭_뷰컨트롤러")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

class 탭_계획_뷰컨트롤러: 공통_네비게이션뷰컨트롤러 {
    
}

class 탭_통계_뷰컨트롤러: 공통_네비게이션뷰컨트롤러 {

}

class 탭_설정_뷰컨트롤러: 공통_네비게이션뷰컨트롤러 {

}
