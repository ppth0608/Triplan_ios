//
//  공통_테이블뷰컨트롤러.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 11..
//  Copyright © 2016년 Ben. All rights reserved.
//

import UIKit
import BPStatusBarAlert

class 공통_테이블뷰컨트롤러: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        네비게이션바세팅()
    }

    override var shouldAutorotate: Bool {
        return false
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }

    func 알림창표시(메세지: String) {
        DispatchQueue.main.async {
            BPStatusBarAlert.shared.show(message: 메세지)
        }
    }

    @IBAction func 푸시_뒤로가기버튼_탭(sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }

    @IBAction func 확인버튼_탭(sender: UIButton) {
        // override
    }

    deinit {
        NSLog("deinit -- 공통_테이블뷰컨트롤러")
    }
}

extension 공통_테이블뷰컨트롤러 {

    func 네비게이션바세팅() {
        // noop
    }
}
