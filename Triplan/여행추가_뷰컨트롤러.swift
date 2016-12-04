//
//  여행추가_뷰컨트롤러.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 4..
//  Copyright © 2016년 Ben. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class 여행추가_뷰컨트롤러: UIViewController {
    
    static var 인스턴스: 여행추가_뷰컨트롤러 {
        return UIStoryboard(name: "AddTravel", bundle: nil).instantiateViewController(withIdentifier: "여행추가") as! 여행추가_뷰컨트롤러
    }
}

