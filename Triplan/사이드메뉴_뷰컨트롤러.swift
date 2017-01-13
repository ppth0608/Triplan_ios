//
//  사이드메뉴_뷰컨트롤러.swift
//  Triplan
//
//  Created by Naver on 2017. 1. 11..
//  Copyright © 2017년 Ben. All rights reserved.
//

import UIKit

class 사이드메뉴_뷰컨트롤러: UIViewController {
    
    deinit {
        NSLog("deinit -- 사이드메뉴_뷰컨트롤러")
    }
    
    override func viewDidLoad() {
        
        let edgeGestureRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(사이드메뉴_뷰컨트롤러.메인으로이동(_:)))
        edgeGestureRecognizer.edges = .right
        view.addGestureRecognizer(edgeGestureRecognizer)
    }
    
    func 메인으로이동(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}


