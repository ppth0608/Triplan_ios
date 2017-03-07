//
//  BaseViewController.swift
//  Triplan
//
//  Created by Naver on 2017. 3. 7..
//  Copyright © 2017년 Ben. All rights reserved.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {

    let disposeBag = DisposeBag()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required convenience init?(coder aDecorder: NSCoder) {
        self.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
