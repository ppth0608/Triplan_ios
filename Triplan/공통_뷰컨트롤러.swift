//
//  UIViewController.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 3..
//  Copyright © 2016년 Ben. All rights reserved.
//

import UIKit

class 공통_뷰컨트롤러: UIViewController {
    
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
    
    @IBAction func 푸시_메뉴버튼_탭(sender: UIButton) {
    }
    
    @IBAction func 푸시_환율버튼_탭(sender: UIButton) {
        let 뷰컨트롤러 = CurrencyViewController.인스턴스
        show(뷰컨트롤러, sender: self)
    }
    
    @IBAction func 모달_닫기버튼_탭(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
