//
//  StroyboardIdentifiable.swift
//  Triplan
//
//  Created by Naver on 2016. 12. 14..
//  Copyright © 2016년 Ben. All rights reserved.
//

import UIKit

protocol StoryboardIdentifiable {
    
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable {
    
    static var storyboardIdentifier: String {
        return String(describing: Self.self)
    }
}
