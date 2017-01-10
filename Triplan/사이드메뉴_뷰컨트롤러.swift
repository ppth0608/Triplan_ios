//
//  사이드메뉴_뷰컨트롤러.swift
//  Triplan
//
//  Created by Naver on 2017. 1. 11..
//  Copyright © 2017년 Ben. All rights reserved.
//

import UIKit

class 사이드메뉴_뷰컨트롤러: UIViewController {
    
    @IBOutlet weak var 메인뷰컨트롤러스냅샷뷰: UIView!
    
    var 스냅샷: UIView? {
        didSet {
            
        }
    }
    
    deinit {
        NSLog("deinit -- 사이드메뉴_뷰컨트롤러")
    }
}
