//
//  공통_네비게이션뷰컨트롤러.swift
//  Triplan
//
//  Created by Naver on 2017. 1. 2..
//  Copyright © 2017년 Ben. All rights reserved.
//

import UIKit

class 공통_네비게이션뷰컨트롤러: 공통_뷰컨트롤러 {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        네비게이션바세팅()
    }
}

extension 공통_네비게이션뷰컨트롤러 {
    
    func 네비게이션바세팅() {
        // noop
    }
}

extension 공통_네비게이션뷰컨트롤러: UIGestureRecognizerDelegate {
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard let 네비게이션뷰컨트롤러 = self.navigationController else { return false }
        
        if 네비게이션뷰컨트롤러.topViewController is 메인_뷰컨트롤러 {
            performSegue(withIdentifier: "메뉴세그웨이", sender: nil)
        }
        
        if 네비게이션뷰컨트롤러.viewControllers.count > 1 {
            return true
        }
        return false
    }
}
