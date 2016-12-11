//
//  공통_테이블뷰컨트롤러.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 11..
//  Copyright © 2016년 Ben. All rights reserved.
//

import UIKit

class 공통_테이블뷰컨트롤러: UITableViewController {
 
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
    
    override var title: String? {
        didSet {
            navigationController?.navigationBar.topItem?.title = self.title
        }
    }
    
    func 네비게이션바세팅(타이틀: String) {
        title = 타이틀
    }
    
    @IBAction func 푸시_뒤로가기버튼_탭(sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func 확인버튼_탭(sender: UIButton) {
        // override
    }
}
