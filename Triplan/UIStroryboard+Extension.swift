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
    
    var filename: String {
        return self.rawValue.capitalized
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
