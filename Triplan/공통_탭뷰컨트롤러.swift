//
//  공통_탭뷰컨트롤러.swift
//  Triplan
//
//  Created by Naver on 2017. 1. 8..
//  Copyright © 2017년 Ben. All rights reserved.
//

import UIKit

class 공통_탭뷰컨트롤러: 공통_네비게이션뷰컨트롤러, ViewControllerContainCircleTransition {
    
    var 커스텀트랜지션닫기영역: UIView?
    
    var circleTransitionTriggerView: UIView? {
        return 커스텀트랜지션닫기영역
    }
    
    @IBAction func 커스텀_트랜지션_닫기버튼_탭(sender: UIButton) {
        커스텀트랜지션닫기영역 = sender
        performSegue(withIdentifier: "커스텀트랜지션언와인드", sender: nil)
    }
}
