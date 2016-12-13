//
//  StoryboardInstantiable.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 14..
//  Copyright © 2016년 Ben. All rights reserved.
//

import UIKit

public protocol StoryboardInstantiable { }

extension StoryboardInstantiable where Self: UIViewController {
    static func 뷰컨트롤러생성(of storyboard: Storyboard) -> Self {
        return UIStoryboard(storyboard: storyboard).instantiateViewController()
    }
}

extension UIViewController: StoryboardInstantiable { }
