//
//  상세_계획_추가_뷰컨트롤러.swift
//  Triplan
//
//  Created by Naver on 2017. 1. 7..
//  Copyright © 2017년 Ben. All rights reserved.
//

import UIKit

class 상세_계획_추가_뷰컨트롤러: 공통_네비게이션뷰컨트롤러 {

    deinit {
        NSLog("deinit -- 상세_계획_뷰컨트롤러")
    }
}

// MARK: - UIViewController
extension 상세_계획_추가_뷰컨트롤러 {

    override func viewDidLoad() {
        super.viewDidLoad()
        디폴트세팅()
        옵져버세팅()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func 네비게이션바세팅() {

    }
}

// MARK: - Private
fileprivate extension 상세_계획_추가_뷰컨트롤러 {

    func 디폴트세팅() {

    }

    func 옵져버세팅() {

    }
}

extension 상세_계획_추가_뷰컨트롤러 {

}
