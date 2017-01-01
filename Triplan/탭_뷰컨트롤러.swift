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

protocol TabBarViewControllerHasTravelInfo: class {
    
    var 컨테이너뷰연결세그웨이식별값: String { get }
}

class 공통_탭바_뷰컨트롤러: 공통_뷰컨트롤러, TabBarViewControllerHasTravelInfo {
    
    var 컨테이너뷰연결세그웨이식별값: String {
        return "컨테이너뷰연결"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == 컨테이너뷰연결세그웨이식별값 {
            guard let 여행정보키 = sender as? String else {
                return
            }
            if let vc = segue.destination as? 상세_계획_뷰컨트롤러 {
                vc.여행정보키값 = 여행정보키
            } else {
                fatalError("\(self) prepare segue's destination controller not matched")
            }
        }
    }
}

class 탭_계획_뷰컨트롤러: 공통_탭바_뷰컨트롤러 {
    
}

class 탭_통계_뷰컨트롤러: 공통_탭바_뷰컨트롤러 {

}

class 탭_설정_뷰컨트롤러: 공통_탭바_뷰컨트롤러 {

}
