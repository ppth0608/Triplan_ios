//
//  UIViewController.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 3..
//  Copyright © 2016년 Ben. All rights reserved.
//

import UIKit
import JDropDownAlert

class 공통_뷰컨트롤러: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            let 알림창 = JDropDownAlert(position: .top, direction: .normal)
            알림창.alertWith(메세지, delay: 2)
        }
    }
    
    @IBAction func 푸시_뒤로가기버튼_탭(sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func 푸시_메뉴버튼_탭(sender: UIButton) {
    }
    
    @IBAction func 푸시_환율버튼_탭(sender: UIButton) {
        let 뷰컨트롤러 = CurrencyViewController.뷰컨트롤러생성(of: .currency)
        show(뷰컨트롤러, sender: self)
    }
    
    @IBAction func 모달_닫기버튼_탭(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    deinit {
        NSLog("deinit -- 공통_뷰컨트롤러")
    }
}
