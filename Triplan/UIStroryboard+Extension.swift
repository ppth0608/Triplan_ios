//
//  UIStroryboard+Extension.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 14..
//  Copyright © 2016년 Ben. All rights reserved.
//

import UIKit

enum Storyboard: String {

    case main
    case addition
    case currency
    case tabbar
    case schedule
    case statistics
    case setting
    case addSchedule

    var filename: String {
        var 파일이름 = self.rawValue
        let 첫번째알파벳 = String(파일이름.remove(at: 파일이름.startIndex))
        let 소문자로변환된첫번째알파벳 = Character(첫번째알파벳.uppercased())
        파일이름.insert(소문자로변환된첫번째알파벳, at: 파일이름.startIndex)
        return 파일이름
    }
}

extension UIStoryboard {

    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.filename, bundle: bundle)
    }

    class func storyboard(_ storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.filename, bundle: bundle)
    }

    func instantiateViewController<T: UIViewController>() -> T where T: StoryboardIdentifiable {
        guard let viewController =
            self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier) ")
        }

        return viewController
    }
}
